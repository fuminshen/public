package com.fumin.hadoop.custom.partition;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;


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
		job.setMapOutputValueClass(Entities.class);
		
		FileInputFormat.setInputPaths(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		job.setPartitionerClass(CustomPartition.class);
		job.setNumReduceTasks(4);
		
		boolean result = job.waitForCompletion(true);
		
		System.exit(result?0:1);
	}
}
