package com.fumin.hadoop.custom.outputformat;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * 自定义文件输出类。
 * 1.自定义一个OutputFormat类，并重写getRecordWriter方法
 * 2.自定义getRecordWriter里的自定义RecordWriter。
 * 重点在第二步，第一步主要是为了调用第二步而写，在第二步中完成要实现的内容。
 *
 */
public class OutputFormatDriver {

	public static void main(String[] args) throws Exception{
		if(args.length!=2) {
			args = new String[] {"E:\\hadoop_test\\input_hanzi","E:\\hadoop_test\\output"};
		}
		
		Job job = Job.getInstance(new Configuration());
		job.setJarByClass(OutputFormatDriver.class);
		
		job.setMapperClass(Mapper.class);
		job.setReducerClass(Reduce.class);
		
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(IntWritable.class);
		
		FileInputFormat.setInputPaths(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		job.setOutputFormatClass(CustomOutputFormat.class);
		
		boolean result = job.waitForCompletion(true);
		
		System.exit(result?0:1);
	}
}
