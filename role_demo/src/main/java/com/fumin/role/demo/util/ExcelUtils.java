package com.fumin.role.demo.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



public class ExcelUtils {
	private static final Logger log = LoggerFactory.getLogger(ExcelUtils.class);
	
	public static Workbook openWorkbook(InputStream inStr) {
		try {
			return WorkbookFactory.create(inStr);
		}catch (InvalidFormatException e) {
			throw new FmException("不是一个标准的Excel文件");
		} catch (EncryptedDocumentException | IOException e) {
			throw new FmException("打开文件失败："+e.getMessage());
		}
    }
	
	public static Workbook newWorkbook() {
		return new XSSFWorkbook();
	}
	
	public static Workbook openWorkbook(String fileName) {
		try {
			return WorkbookFactory.create(new File(fileName));
		}catch (InvalidFormatException e) {
			throw new FmException("不是一个标准的Excel文件");
		} catch (EncryptedDocumentException | IOException e) {
			throw new FmException("打开文件失败："+e.getMessage());
		}
	}
	
	public static void write(Workbook workbook,String fileName) {
		try {
			FileOutputStream excelFileOutPutStream = new FileOutputStream(fileName);
			IOUtils.writeAndClose(workbook, excelFileOutPutStream);
		} catch (Exception e) {
			throw new FmException("保存Excel文件失败："+e.getMessage());
		}
	}
	
	public static void clear(Workbook workbook) {
		try {
			if(workbook!=null) {
				workbook.close();
			}
		} catch (IOException e) {
			throw new FmException("关闭资源失败："+e.getMessage());
		}
	}

	public static String getCellString(Cell cell) {
		String value=null;
		CellType cellTypeEnum = cell.getCellTypeEnum();
        switch (cellTypeEnum) {
		case BOOLEAN:{
			value= cell.getBooleanCellValue()+"";
			break;
		}
		case NUMERIC:{
			if(DateUtil.isCellDateFormatted(cell)) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				value= sdf.format( cell.getDateCellValue() );
			}else {
				DecimalFormat decimalFormat = new DecimalFormat("#.#");
				value= decimalFormat.format( cell.getNumericCellValue() );
			}
			break;
		}
		case STRING:{
			value=cell.getStringCellValue();
			break;
		}
		default:
			value="";
			break;
        }
        return value;
	}
	
	public static double getCellDouble(Cell cell) {
		double value=0;
		CellType cellTypeEnum = cell.getCellTypeEnum();
        switch (cellTypeEnum) {
		case BOOLEAN:{
			value= 0;
			break;
		}
		case NUMERIC:{
			value= cell.getNumericCellValue();
			break;
		}
		case STRING:{
			String txt = cell.getStringCellValue().replaceAll(",", "").replaceAll("$,", "").replaceAll("￥", "");
			try {
				value= Double.parseDouble( txt );
			} catch (Exception e) {
				log.warn(e.getMessage());
				throw new FmException(e.getMessage()+"(数字中夹杂了特殊字符，转换失败)");
			}
			
			break;
		}
		default:
			value= 0;
			break;
        }
        return value;
	}
	
	public static Date getCellDate(Cell cell) {
		Date value=null;
		CellType cellTypeEnum = cell.getCellTypeEnum();
        switch (cellTypeEnum) {
		case BOOLEAN:{
			value= null;
			break;
		}
		case NUMERIC:{
			if(DateUtil.isCellDateFormatted(cell)) {
				value= cell.getDateCellValue();
			}else {
				String str=new BigDecimal(cell.getNumericCellValue()).toPlainString();
				String reg="[0-9]{8}$";
				String key;
				boolean isMatch = Pattern.matches(reg, str);
				if(isMatch) {
					key = "yyyyMMdd";
				}else {
					throw new FmException("时间格式错误，请设置时间为“年-月-日”格式");
				}
				SimpleDateFormat sdf=new SimpleDateFormat(key);
				
				try {
					value = sdf.parse(str);
				} catch (ParseException e) {
					throw new FmException("时间格式错误，请设置时间为“年-月-日”格式");
				}
			}
			break;
		}
		case STRING:{
			String str=cell.getStringCellValue();
			String reg="[0-9]{8}$";
			String key;
			boolean isMatch = Pattern.matches(reg, str);
			if(isMatch) {
				key = "yyyyMMdd";
			}else {
				reg = "^\\d{4}\\-\\d{1,2}\\-\\d{1,2}$";
				isMatch = Pattern.matches(reg, str);
				if(isMatch) {
					key = "yyyy-MM-dd";
				}else {
					reg = "[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}";
					isMatch = Pattern.matches(reg, str);
					if(isMatch) {
						key = "yyyy/MM/dd";
					}else {
						throw new FmException("时间格式错误，请设置时间为“年-月-日”格式");
					}
				}
			}
			
			SimpleDateFormat sdf=new SimpleDateFormat(key);
			
			try {
				value = sdf.parse(str);
			} catch (ParseException e) {
				throw new FmException("时间格式错误，请设置时间为“年-月-日”格式");
			}
			break;
		}
		default:
			value= null;
			break;
        }
        return value;
	}
	
	public static void deleteRow(Sheet sheet,int rownum){
		int lastRowNum = sheet.getLastRowNum();
		//此方法是将余下的行向上移
		sheet.shiftRows(rownum+1, lastRowNum, -1);
		log.debug("删除第"+rownum+"行，还剩余"+sheet.getLastRowNum()+"行");
	}
	
	public static void removeEmptyRow(Sheet sheet) {
		Row row=null;
		int rowsCount = 0;
		while(rowsCount<= sheet.getLastRowNum()){
    		row = sheet.getRow(rowsCount);
            if (row == null) {
                deleteRow(sheet, rowsCount);
            }else {
            	Cell cell = row.getCell(1);
            	if(cell==null || cell.toString().equals("")) {
            		deleteRow(sheet, rowsCount);
            	}else {
            		rowsCount++;
            	}
            }
    	}
	}
}
