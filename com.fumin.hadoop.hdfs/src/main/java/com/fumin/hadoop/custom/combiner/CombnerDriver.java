package com.fumin.hadoop.custom.combiner;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * 统计文章汉字个数的程序，字母按单个计算
 * 通过Combiner	合并，优化程序性能。
 * Combiner只进行局部汇总，在mapper阶段先进行一次汇总。
 * 再进入reduce阶段。
 * 是mapreduc优化的重要手段
 * @author fm
 *
 */
public class CombnerDriver {

	public static void main(String[] args) throws Exception{
		if(args.length!=2) {
			args = new String[] {"E:\\hadoop_test\\input_hanzi","E:\\hadoop_test\\output"};
		}
		
		Job job = Job.getInstance(new Configuration());
		job.setJarByClass(CombnerDriver.class);
		
		job.setMapperClass(Mapper.class);
		job.setReducerClass(Reduce.class);
		
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(IntWritable.class);
		
		FileInputFormat.setInputPaths(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		//job.setPartitionerClass(CustomPartition.class);
		//job.setNumReduceTasks(4);
		job.setCombinerClass(CustomCombiner.class);
		
		boolean result = job.waitForCompletion(true);
		
		System.exit(result?0:1);
	}
}
