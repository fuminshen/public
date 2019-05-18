package com.fumin.hadoop.custom.group;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class GroupMapper extends Mapper<LongWritable, Text, Bean, NullWritable> {
	Bean b = new Bean();

	@Override
	protected void map(LongWritable key, Text value, Context context)
			throws IOException, InterruptedException {
		String[] d = value.toString().split("\t",-1);
		b.setId(d[0]);
		b.setOrdersId(d[1]);
		b.setProductsId(d[2]);
		b.setCode(d[3]);
		b.setManufacturerid(Integer.parseInt(d[4]));
		b.setCount(Integer.parseInt(d[5]));
		b.setPrice(Double.parseDouble(d[6]));
		b.setCost(Double.parseDouble(d[7]));
		b.setName(d[8]);
		b.setContents(d[9]);
		
		context.write(b, NullWritable.get());
	}
	
}
