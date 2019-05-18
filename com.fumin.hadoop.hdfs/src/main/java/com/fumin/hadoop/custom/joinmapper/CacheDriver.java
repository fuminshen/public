package com.fumin.hadoop.custom.joinmapper;

import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * 使用缓存文件示例
 * 示例中使用了缓存文件，并关闭了reduce task
 * 关闭reduce task的同时也取消了shaffer过程，性能得到了提升
 * 与此同时失去了排序功能
 * 并在map中增加了计数功能
 * @author fm
 *
 */
public class CacheDriver {

	public static void main(String[] args) throws Exception {
		if(args.length!=2) {
			args = new String[] {"E:\\hadoop_test\\input_order","E:\\hadoop_test\\output"};
		}
		
		Configuration conf = new Configuration();
		Job job = Job.getInstance(conf );
		
		job.setJarByClass(CacheDriver.class);
		
		job.setMapperClass(CacheMapper.class);
		//job.setReducerClass(GroupReduce.class);
		
		//取消了reduce task过程，同时也无需设置MapOutput的值了
		job.setNumReduceTasks(0);
		//job.setMapOutputKeyClass(IntWritable.class);
		//job.setMapOutputValueClass(Bean.class);
		
		job.setOutputKeyClass(Bean.class);
		job.setOutputValueClass(NullWritable.class);
		
		//job.setGroupingComparatorClass(CustomGroup.class);
		job.addCacheFile(new URI("file:///E:/hadoop_test/input_order/products.txt"));
		
		
		
		FileInputFormat.setInputPaths(job, args[0]);
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		boolean result = job.waitForCompletion(true);
		
		System.exit(result?0:1);
	}
}
