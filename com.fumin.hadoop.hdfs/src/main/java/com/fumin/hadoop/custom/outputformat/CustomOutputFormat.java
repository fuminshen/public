package com.fumin.hadoop.custom.outputformat;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.RecordWriter;
import org.apache.hadoop.mapreduce.TaskAttemptContext;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class CustomOutputFormat extends FileOutputFormat<Text, IntWritable> {

	@Override
	public RecordWriter<Text, IntWritable> getRecordWriter(TaskAttemptContext job) throws IOException, InterruptedException {
		RecordWriter<Text, IntWritable> rw =new CustomRecordWriter(job);
		//rw.
		return rw;
	}

}
