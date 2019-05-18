package com.fumin.hadoop.custom.bean;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;

public class Mapper extends org.apache.hadoop.mapreduce.Mapper<LongWritable, Text, LongWritable, Entity> {

	Entity e = new Entity();
	LongWritable k = new LongWritable();
	
	@Override
	protected void map(LongWritable key, Text value,Context context)
			throws IOException, InterruptedException {
		
		String[] vs = value.toString().split("\\^",-1);
		
		e.setKey( Long.valueOf(vs[19]) );
		e.setValue(vs[3]);
		k.set(e.getKey());
		
		context.write(k, e);
	}
}
