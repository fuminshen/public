package com.fumin.hadoop.custom.sort;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;

public class Mapper extends org.apache.hadoop.mapreduce.Mapper<LongWritable, Text, Entities, Entities> {

	Entities e = new Entities();
	LongWritable k = new LongWritable();
	
	@Override
	protected void map(LongWritable key, Text value,Context context)
			throws IOException, InterruptedException {
		
		String[] vs = value.toString().split("\\^",-1);
		
		e.setId( Integer.valueOf(vs[0]) );
		e.setName(vs[3]);
		e.setCount(Integer.valueOf(vs[19]));
		//k.set(e.getId());
		
		context.write(e, e);
	}
}
