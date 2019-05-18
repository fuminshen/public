package com.fumin.hadoop.yarn;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class Reduce extends Reducer<Text, IntWritable, Text, IntWritable> {
	IntWritable sum = new IntWritable(0);

	@SuppressWarnings("unused")
	@Override
	protected void reduce(Text key, Iterable<IntWritable> values,Context context) throws IOException, InterruptedException {
		int su=0;
		for (IntWritable value : values) {
			su+=1;
		}
		sum.set(su);
		context.write(key, sum);
	}
}
