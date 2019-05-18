package com.fumin.hadoop.custom.joinmapper;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URI;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;

public class CacheMapper extends Mapper<LongWritable, Text, Bean, NullWritable> {
	Bean b = new Bean();
	private Map<String, String> prtNames = new HashMap<String, String>();
	String fileName;
	@Override
	protected void setup(Context context)
			throws IOException, InterruptedException {
		URI[] cacheFiles = context.getCacheFiles();
		String path = cacheFiles[0].getPath();
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF8"));
		String line;
		while(StringUtils.isNotEmpty(line = br.readLine())) {
			String[] split = line.split("\t",-1);
			prtNames.put(split[0], split[6]);
		}
		IOUtils.closeStream(br);
		fileName = ((FileSplit)context.getInputSplit()).getPath().getName();
	}
	
	@Override
	protected void map(LongWritable key, Text value, Context context)
			throws IOException, InterruptedException {
		if(fileName.startsWith("product")) {
			context.getCounter("map", "filename-product").increment(1);
			return;
		}
		context.getCounter("map", "filename-order_info").increment(1);
		String[] d = value.toString().split("\t",-1);
		
		b.setId(d[0]);
		b.setOrdersId(d[1]);
		b.setProductsId(d[2]);
		b.setCode(d[3]);
		b.setManufacturerid(Integer.parseInt(d[4]));
		b.setCount(Integer.parseInt(d[5]));
		b.setPrice(Double.parseDouble(d[6]));
		b.setCost(Double.parseDouble(d[7]));
		b.setName(prtNames.get(d[2]));
		
		context.write(b, NullWritable.get());
	}
}
