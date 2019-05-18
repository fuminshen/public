package com.fumin.hadoop.custom.fileinput;

import java.io.IOException;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.InputSplit;
import org.apache.hadoop.mapreduce.JobContext;
import org.apache.hadoop.mapreduce.RecordReader;
import org.apache.hadoop.mapreduce.TaskAttemptContext;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;

public class SmallFile extends FileInputFormat<Text,BytesWritable> {
	
	//重写小文件整合，要求不能被切割，所以直接返回felse
	@Override
	protected boolean isSplitable(JobContext context, Path filename) {
		return false;
	}

	@Override
	public RecordReader<Text,BytesWritable> createRecordReader(InputSplit split, TaskAttemptContext context)
			throws IOException, InterruptedException {
		SmallFileRecordReader recordReader = new SmallFileRecordReader();
		recordReader.initialize(split, context);
		return recordReader;
	}

}
