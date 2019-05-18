package com.fumin.hadoop.custom.bean;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class Reduce extends Reducer<LongWritable, Entity, Text, Text> {

	String names="";
	Text v= new Text();
	Text k= new Text();
	@Override
	protected void reduce(LongWritable key, Iterable<Entity> values,Context context) throws IOException, InterruptedException {
		names="";
		int sum=0;
		for (Entity value : values) {
			names+=value.getValue()+",";
			sum+=value.getKey();
		}
		names+=sum;
		v.set(names);
		k.set(key.toString());
		context.write(k, v);
	}
}
