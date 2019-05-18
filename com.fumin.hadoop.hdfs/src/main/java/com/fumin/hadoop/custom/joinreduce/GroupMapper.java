package com.fumin.hadoop.custom.joinreduce;

import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;

public class GroupMapper extends Mapper<LongWritable, Text, IntWritable, Bean> {
	Bean b = new Bean();
	IntWritable k = new IntWritable();
	String fileName;

	@Override
	protected void setup(Context context)
			throws IOException, InterruptedException {
		FileSplit split = (FileSplit)context.getInputSplit();
		fileName = split.getPath().getName();
	}
	
	@Override
	protected void map(LongWritable key, Text value, Context context)
			throws IOException, InterruptedException {
		String[] d = value.toString().split("\t",-1);
		if(fileName.startsWith("orders")) {
			//是orders_info表
			k.set(Integer.parseInt(d[2]));
			
			b.setId(d[0]);
			b.setOrdersId(d[1]);
			b.setProductsId(d[2]);
			b.setCode(d[3]);
			b.setManufacturerid(Integer.parseInt(d[4]));
			b.setCount(Integer.parseInt(d[5]));
			b.setPrice(Double.parseDouble(d[6]));
			b.setCost(Double.parseDouble(d[7]));
			b.setName("");
		}else {
			//是product表
			k.set(Integer.parseInt(d[0]));
			
			b.setId("");
			b.setOrdersId("");
			b.setProductsId(d[2]);
			b.setCode("");
			b.setManufacturerid(0);
			b.setCount(0);
			b.setPrice(0);
			b.setCost(0);
			b.setName(d[6]);
		}
		/*b.setId(d[0]);
		b.setOrdersId(d[1]);
		b.setProductsId(d[2]);
		b.setCode(d[3]);
		b.setManufacturerid(Integer.parseInt(d[4]));
		b.setCount(Integer.parseInt(d[5]));
		b.setPrice(Double.parseDouble(d[6]));
		b.setCost(Double.parseDouble(d[7]));
		b.setName(d[8]);
		b.setContents(d[9]);*/
		
		context.write(k, b);
	}
	
}
