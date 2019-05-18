package com.fumin.hadoop.custom.combiner;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class CustomCombiner extends Reducer<Text, IntWritable, Text, IntWritable>{
	IntWritable v= new IntWritable();
	@Override
	protected void reduce(Text text, Iterable<IntWritable> values,Context context) throws IOException, InterruptedException {
		int sum=0;
		for (IntWritable value : values) {
			sum+=value.get();
		}
		v.set(sum);
		context.write(text, v);
	}
}
