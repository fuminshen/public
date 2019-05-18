package com.fumin.hadoop.yarn;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;

public class Mapper extends org.apache.hadoop.mapreduce.Mapper<LongWritable, Text, Text, IntWritable> {

	Text textKey = new Text();
	IntWritable intValue = new IntWritable(1);
	
	@Override
	protected void map(LongWritable key, Text value,
			org.apache.hadoop.mapreduce.Mapper<LongWritable, Text, Text, IntWritable>.Context context)
			throws IOException, InterruptedException {
		
		String line = value.toString();
		String[] words = line.split(" ");
		
		for (String word : words) {
			textKey.set(word);
			context.write(textKey, intValue );
		}
	}
}
