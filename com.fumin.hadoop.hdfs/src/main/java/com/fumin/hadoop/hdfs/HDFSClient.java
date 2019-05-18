package com.fumin.hadoop.hdfs;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.junit.Test;

public class HDFSClient {
/*
	@Test
	public void test() throws IOException, InterruptedException, URISyntaxException {
		Configuration conf = new Configuration();
		//conf.set("fs.defaultFS", "hdfs://hadoop4:9000");
		FileSystem fs = FileSystem.get(new URI("hdfs://hadoop4:9000"), conf, "fumin");
		
		 通过流上传文件
		File file = new File("D:/Dreamweaver8.rar");
		FileInputStream is = new FileInputStream(file);
		FSDataOutputStream fos = fs.create(new Path("/"+file.getName()));
		IOUtils.copyBytes(is, fos, conf);
		IOUtils.closeStream(fos);
		IOUtils.closeStream(is);
		
		
		
		File file = new File("D:/Dreamweaver8.8.8.8.rar");
		FSDataInputStream in = fs.open(new Path("/Dreamweaver8.rar"));
		FileOutputStream fos = new FileOutputStream(file);
		IOUtils.copyBytes(in, fos, conf);
		IOUtils.closeStream(fos);
		IOUtils.closeStream(in);
		
		
		 指定文件流的读取位置
		FSDataInputStream in = fs.open(new Path("/Dreamweaver8.rar"));
		in.seek(9l);
		
		
		//新建目录
		//fs.mkdirs(new Path("/newPath1"));
		
		//删除文件||目录
		//fs.delete(new Path("/hadoop-2.7.7.tar.gz"),true);
		try {
			fs.mkdirs(new Path("/test_mkdirs"));
		}
		finally {
			fs.close();
			System.out.println("file system closed");
		}
		
		System.out.println("finished");
	}*/
}
