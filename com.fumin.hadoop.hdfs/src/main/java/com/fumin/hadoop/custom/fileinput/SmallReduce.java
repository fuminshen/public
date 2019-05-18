package com.fumin.hadoop.custom.fileinput;

import java.io.IOException;

import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;


public class SmallReduce extends Reducer<Text,BytesWritable, Text,BytesWritable> {

	@Override
	protected void reduce(Text key, Iterable<BytesWritable> value,
			Reducer<Text, BytesWritable, Text, BytesWritable>.Context context) throws IOException, InterruptedException {
		
		for (BytesWritable v : value) {
			context.write(key, v);
		}
		
	}
}
