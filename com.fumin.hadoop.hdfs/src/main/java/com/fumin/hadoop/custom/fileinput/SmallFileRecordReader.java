package com.fumin.hadoop.custom.fileinput;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.InputSplit;
import org.apache.hadoop.mapreduce.RecordReader;
import org.apache.hadoop.mapreduce.TaskAttemptContext;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;

public class SmallFileRecordReader extends RecordReader<Text,BytesWritable> {

	FileSplit fileSplit;
	Configuration configuration;
	
	Text key =new Text();
	BytesWritable value = new BytesWritable();
	
	boolean isProgress = true;
	
	@Override
	public void initialize(InputSplit split, TaskAttemptContext context) throws IOException, InterruptedException {
		// 初始化
		fileSplit = (FileSplit) split;
		configuration = context.getConfiguration();
	}

	@Override
	public boolean nextKeyValue() throws IOException, InterruptedException {
		// 核心业务逻辑
		
		if(!isProgress) {
			return false;
		}
		
		// 1 获取fs文件对象
		Path path = fileSplit.getPath();
		FileSystem fs = path.getFileSystem(configuration);
		
		// 2 获取输入流
		FSDataInputStream in = fs.open(path);
		
		// 3 拷贝
		byte[] buf = new byte[(int) fileSplit.getLength()];
		IOUtils.readFully(in, buf, 0, buf.length);
		
		// 4 封装value
		value.set(buf, 0, buf.length);
		
		// 5 封装key
		key.set(path.toString());
		
		// 6 关闭资源
		IOUtils.closeStream(in);
		
		isProgress=false;
		
		return true;
	}

	@Override
	public Text getCurrentKey() throws IOException, InterruptedException {
		
		return key;
	}

	@Override
	public BytesWritable getCurrentValue() throws IOException, InterruptedException {

		return value;
	}

	@Override
	public float getProgress() throws IOException, InterruptedException {
		return 0;
	}

	@Override
	public void close() throws IOException {
		
	}


}
