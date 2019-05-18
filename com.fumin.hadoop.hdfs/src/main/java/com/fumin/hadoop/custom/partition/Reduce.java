package com.fumin.hadoop.custom.partition;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class Reduce extends Reducer<LongWritable, Entities, Text, Text> {

	Text v= new Text();
	Text k= new Text();
	@Override
	protected void reduce(LongWritable key, Iterable<Entities> values,Context context) throws IOException, InterruptedException {
		//names="";
		//int sum=0;
		for (Entities value : values) {
			//names+=value.getId()+",";
			//sum+=value.getId();
			v.set(value.toString());
			k.set(key.toString());
			context.write(k, v);
		}
	}
}
