package com.fumin.hadoop.custom.group;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * 自定义分组
 * @author fm
 *
 */
public class GroupDriver {

	public static void main(String[] args) throws Exception {
		if(args.length!=2) {
			args = new String[] {"E:\\hadoop_test\\input_order","E:\\hadoop_test\\output1"};
		}
		
		Configuration conf = new Configuration();
		Job job = Job.getInstance(conf );
		
		job.setJarByClass(GroupDriver.class);
		
		job.setMapperClass(GroupMapper.class);
		job.setReducerClass(GroupReduce.class);
		
		job.setMapOutputKeyClass(Bean.class);
		job.setMapOutputValueClass(NullWritable.class);
		
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(Text.class);
		
		job.setGroupingComparatorClass(CustomGroup.class);
		
		FileInputFormat.setInputPaths(job, args[0]);
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		boolean result = job.waitForCompletion(true);
		
		System.exit(result?0:1);
	}
}
