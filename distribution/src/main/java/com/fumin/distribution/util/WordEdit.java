package com.fumin.distribution.util;

import java.io.*;
import java.util.*;
import org.apache.poi.POIXMLDocument;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.apache.xmlbeans.XmlCursor;
import org.apache.xmlbeans.XmlObject;
import org.springframework.stereotype.Component;

@Component
public class WordEdit {

	/**
	 * 实现对word读取和修改操作(word2007.docx)
	 * @return 
	 * 
	 */
	public static byte[] readwriteWord2(String filePath, String targetPath, Map<String, String> map) {
		
		File f = new File(targetPath);
		FileOutputStream fos = null;
		XWPFDocument doc = null;
		boolean fileExists = f.exists();
		//System.out.println(targetPath);
		if(!fileExists) {
			try {
				OPCPackage pack = POIXMLDocument.openPackage(filePath);
				doc = new XWPFDocument(pack);

				
				if (!f.getParentFile().exists()) {
					f.getParentFile().mkdirs();
				}
				fos = new FileOutputStream(targetPath, true);
				doc.write(fos);

			} catch (Exception e) {
				throw new RuntimeException(e);
			} finally {
				try {
					if (fos != null) {
						fos.flush();
						fos.close();
					}
					if (doc != null) {
						doc.close();
					}
				} catch (IOException e) {
					throw new RuntimeException(e);
				}

			}
		}
		
		FileOutputStream fos1 = null;
		XWPFDocument doc1 = null;
		ByteArrayOutputStream output = null;
		try {
			OPCPackage pack = POIXMLDocument.openPackage(targetPath);
			doc1 = new XWPFDocument(pack);
			
			if(!fileExists) {
				replaceText(doc1, map);
				updateTable(doc1, map);
			}
			
			output = new ByteArrayOutputStream();
			doc1.write(output);
			return output.toByteArray();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			try {
				if (fos1 != null) {
					fos1.flush();
					fos1.close();
				}
				if (doc1 != null) {
					doc1.close();
				}
				if (output != null) {
					output.close();
				}
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}

	}

	/**
	 * 替换文本内容
	 * 
	 * @param doc
	 * @param map
	 */
	public static void replaceText(XWPFDocument doc, Map<String, String> map) {

		List<XWPFParagraph> paragraphs = doc.getParagraphs();
		// System.out.println(paragraphs.size());
		for (XWPFParagraph tmp : paragraphs) {

			List<XWPFRun> runs = tmp.getRuns();
			for (XWPFRun aa : runs) {
				if (map != null) {

					// 如果段内内容为空则认定包含文本框，则执行替换文本框内容
					if (aa.getText(0) == null) {
						if (tmp.getText().contains("$$constractNumber$$")) {
							XmlObject object = tmp.getCTP().getRArray(0);
							XmlCursor selectPathCursor = getXmlObjectByXPath(object,
									"declare namespace ve='http://schemas.openxmlformats.org/markup-compatibility/2006'; declare namespace o='urn:schemas-microsoft-com:office:office'; declare namespace r='http://schemas.openxmlformats.org/officeDocument/2006/relationships'; declare namespace m='http://schemas.openxmlformats.org/officeDocument/2006/math'; declare namespace v='urn:schemas-microsoft-com:vml'; declare namespace wp='http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing'; declare namespace w10='urn:schemas-microsoft-com:office:word'; declare namespace w='http://schemas.openxmlformats.org/wordprocessingml/2006/main'; declare namespace wne='http://schemas.microsoft.com/office/word/2006/wordml';",
									"$this/w:pict/v:shape/v:textbox/w:txbxContent/w:p");
							selectPathCursor.push();
							selectPathCursor.selectPath(
									"declare namespace ve='http://schemas.openxmlformats.org/markup-compatibility/2006'; declare namespace o='urn:schemas-microsoft-com:office:office'; declare namespace r='http://schemas.openxmlformats.org/officeDocument/2006/relationships'; declare namespace m='http://schemas.openxmlformats.org/officeDocument/2006/math'; declare namespace v='urn:schemas-microsoft-com:vml'; declare namespace wp='http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing'; declare namespace w10='urn:schemas-microsoft-com:office:word'; declare namespace w='http://schemas.openxmlformats.org/wordprocessingml/2006/main'; declare namespace wne='http://schemas.microsoft.com/office/word/2006/wordml';"
											+ "$this/w:r/w:t");
							while (selectPathCursor.toNextSelection()) {
								if (selectPathCursor.getTextValue().equals("$$constractNumber$$")) {
									selectPathCursor.setTextValue(map.get("$$constractNumber$$"));
								}
							}
						}

					} else {
						for (Map.Entry<String, String> entry : map.entrySet()) {
							if (aa.getText(0) != null && aa.getText(0).contains(entry.getKey())) {
								aa.setText(entry.getValue(), 0);
							}
						}
					}
				}
			}
		}
	}

	public static XmlCursor getXmlObjectByXPath(XmlObject xml, String nameSpace, String xpath) {
		// Create a temporary cursor for the XPath passed in
		XmlCursor xpathCursor = xml.newCursor();
		// Create a formatter to format the XPath
		StringBuilder builder = new StringBuilder();
		Formatter formatter = new Formatter(builder);
		formatter.format("%s %s", nameSpace, xpath);
		// Select the XPath
		xpathCursor.selectPath(formatter.toString());
		xpathCursor.toNextSelection();
		formatter.close();
		return xpathCursor;
	}

	/**
	 * 替换表格内容
	 * 
	 * @param doc
	 * @param map
	 */
	public static void updateTable(XWPFDocument doc, Map<String, String> map) {
		List<XWPFTable> tables = doc.getTables();
		int tableNumber = -1;
		for (XWPFTable table : tables) {
			tableNumber++;
			List<XWPFTableRow> rows = table.getRows();
			int tableRow = -1;
			for (XWPFTableRow row : rows) {
				tableRow++;
				List<XWPFTableCell> cells = row.getTableCells();
				int tableCell = -1;
				for (XWPFTableCell cell : cells) {
					tableCell++;
					List<XWPFParagraph> pgs = cell.getParagraphs();
					for (XWPFParagraph tmp : pgs) {

						// List<XWPFRun> runs = tmp.getRuns();
						// for (XWPFRun aa : runs) {
						// System.out.println("XWPFRun-Text:" + aa.getText(0));
						if (map != null) {
							String key = "table_" + tableNumber + "_" + tableRow + "_" + tableCell;
							// System.out.println("key="+key);
							if (map.get(key) != null) {
								XWPFRun runX = tmp.createRun();
								// System.out.println(key+"="+map.get(key));
								runX.setText(map.get(key), 0);
							}
							/*
							 * int tableNumber=0; while(map.get("table"+tableNumber)!=null) { int
							 * tableRow=0; } for (Map.Entry<String, String> entry : map.entrySet()) { if
							 * (aa.getText(0) != null && aa.getText(0).contains(entry.getKey())) { //
							 * aa.setText(entry.getValue(), 0); // System.out.println(aa.getText(0)); } }
							 */
						}
						// }
					}

				}

			}

		}
	}

}
