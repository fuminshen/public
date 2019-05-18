package com.fumin.hadoop.custom.joinreduce;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class GroupReduce extends Reducer<IntWritable, Bean, Text, NullWritable> {
	Text k = new Text();
	Text v = new Text();
	Bean b = new Bean();
	String name=null;

	@Override
	protected void reduce(IntWritable key, Iterable<Bean> values, Context context)
			throws IOException, InterruptedException {
		for (Bean value : values) {
			if(value.getCode().equals("")) {
				//是product表
				name = value.getName();
				break;
			}
		}
		for (Bean value : values) {
			value.setName(name);
			k.set(value.toString());
			context.write(k, NullWritable.get());
		}
	}
}
