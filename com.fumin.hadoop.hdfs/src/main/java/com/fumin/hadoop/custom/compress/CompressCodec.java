package com.fumin.hadoop.custom.compress;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.compress.BZip2Codec;
import org.apache.hadoop.io.compress.CompressionCodec;
import org.apache.hadoop.io.compress.CompressionOutputStream;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.ReflectionUtils;

public class CompressCodec {

	public static void main(String[] args) throws Exception {
		
		Configuration conf = new Configuration();
		//开启map阶段输出的压缩，不影响reduce输出，只需在驱动类加上这2行即可开启
		conf.setBoolean("mapreduce.map.output.compress", true);
		conf.setClass("mapreduce.map.output.compress.codec", BZip2Codec.class,CompressionCodec.class);
		
		Job job = Job.getInstance(conf);
		//开启reduce阶段输出压缩，只需在驱动类加上这2行即可
		FileOutputFormat.setCompressOutput(job, true);
		FileOutputFormat.setOutputCompressorClass(job, BZip2Codec.class);
		
		//程序内压缩代码示例
		//compress("E:\\hadoop_test\\input_order\\orders_info.txt","org.apache.hadoop.io.compress.BZip2Codec");
		compress("E:\\hadoop_test\\input_order\\orders_info.txt","org.apache.hadoop.io.compress.GzipCodec");
		//compress("E:\\hadoop_test\\input_order\\orders_info.txt","org.apache.hadoop.io.compress.DefaultCodec");
	}

	private static void compress(String fileName, String compressClass) throws Exception {
		FileInputStream fis = new FileInputStream(new File(fileName));
		
		//-----------重点，必须使用hadoop的反射工具实例化class---------------------------
		Class<?> cls = Class.forName(compressClass);
		CompressionCodec compress = (CompressionCodec) ReflectionUtils.newInstance(cls, new Configuration());
		
		
		FileOutputStream out = new FileOutputStream("E:/1.txt"+compress.getDefaultExtension());
		CompressionOutputStream cout = compress.createOutputStream(out);
		//CompressionInputStream cin = compress.createInputStream(fis);
		IOUtils.copyBytes(fis, cout, 1024*1024*10, false);
		
		IOUtils.closeStream(cout);
		IOUtils.closeStream(out);
		IOUtils.closeStream(fis);
	}
}
