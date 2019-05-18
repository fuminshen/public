package com.fumin.hadoop.custom.bean;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * 用自定义对象进行传输的示例
 * 先自定义一个对象作为传输k，v的类型
 * 对象实现Writable接口，并提供一个空参构造，如果作为key传输的话还需实现WritableComparable<T>接口
 * @author fm
 *
 */
public class EntityDriver {

	public static void main(String[] args) throws Exception {
		args = new String[] {"E:\\hadoop_test\\input","E:\\hadoop_test\\output"};
		
		Job job = Job.getInstance(new Configuration());
		job.setJarByClass(EntityDriver.class);
		
		job.setMapperClass(Mapper.class);
		job.setReducerClass(Reduce.class);
		
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(Text.class);
		
		job.setMapOutputKeyClass(LongWritable.class);
		job.setMapOutputValueClass(Entity.class);
		
		FileInputFormat.setInputPaths(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		boolean result = job.waitForCompletion(true);
		
		System.exit(result?0:1);
	}
}
