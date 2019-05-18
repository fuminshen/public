package com.fumin.hadoop.custom.group;

import java.io.IOException;

import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class GroupReduce extends Reducer<Bean, NullWritable, Text, Text> {
	Text k = new Text();
	Text v = new Text();

	@Override
	protected void reduce(Bean key, Iterable<NullWritable> value,Context context) throws IOException, InterruptedException {
		for (NullWritable nullWritable : value) {
			k.set(key.getOrdersId());
			v.set(key.getProductsId()+"\t"+key.getPrice()+"\t"+key.getCode()+"\t"+key.getName());
			context.write(k, v);
		}
		
	}
}
