package com.fumin.hadoop.custom.compress;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.compress.BZip2Codec;
import org.apache.hadoop.io.compress.CompressionCodec;
import org.apache.hadoop.io.compress.CompressionCodecFactory;
import org.apache.hadoop.io.compress.CompressionInputStream;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class CompressDecodec {

	public static void main(String[] args) throws Exception {
		
		Configuration conf = new Configuration();
		//开启map阶段输出的压缩，不影响reduce输出，只需在驱动类加上这2行即可开启
		conf.setBoolean("mapreduce.map.output.compress", true);
		conf.setClass("mapreduce.map.output.compress.codec", BZip2Codec.class,CompressionCodec.class);
		
		Job job = Job.getInstance(conf);
		//开启reduce阶段输出压缩，只需在驱动类加上这2行即可
		FileOutputFormat.setCompressOutput(job, true);
		FileOutputFormat.setOutputCompressorClass(job, BZip2Codec.class);
		
		
		//程序内解压缩代码示例
		//decompress("E:\\1.txt.bz2");
		decompress("E:\\1.txt.gz");
		//decompress("E:\\1.txt.deflate");
	}

	private static void decompress(String fileName) throws Exception {
		//--------------获取压缩工厂---------------------
		CompressionCodecFactory factory = new CompressionCodecFactory(new Configuration());
		//--------------判断文件是否能被解压缩------------
		CompressionCodec codec = factory.getCodec(new Path(fileName));
		
		
		if(codec==null) {
			System.out.println("不是正确的压缩文件");
			return ;
		}
		CompressionInputStream cin = codec.createInputStream(new FileInputStream(fileName));
		FileOutputStream out = new FileOutputStream("E:/file"+codec.getDefaultExtension()+".txt");
		
		IOUtils.copyBytes(cin, out, 1024*1024*10, true);
	}
}
