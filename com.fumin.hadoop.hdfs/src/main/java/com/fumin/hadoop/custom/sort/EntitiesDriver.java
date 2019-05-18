package com.fumin.hadoop.custom.sort;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * 通过传输自定义对象key实现自定义排序
 * 在自定义对象上实现WritableComparable接口
 * @author fm
 *
 */
public class EntitiesDriver {

	public static void main(String[] args) throws Exception {
		if(args.length!=2) {
			args = new String[] {"E:\\hadoop_test\\input","E:\\hadoop_test\\output"};
		}
		
		Job job = Job.getInstance(new Configuration());
		job.setJarByClass(EntitiesDriver.class);
		
		job.setMapperClass(Mapper.class);
		job.setReducerClass(Reduce.class);
		
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(Text.class);
		
		job.setMapOutputKeyClass(Entities.class);
		job.setMapOutputValueClass(Entities.class);
		
		FileInputFormat.setInputPaths(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		job.setPartitionerClass(CustomPartition.class);
		job.setNumReduceTasks(4);
		
		boolean result = job.waitForCompletion(true);
		
		System.exit(result?0:1);
	}
}
