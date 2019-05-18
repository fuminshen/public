package com.fumin.hadoop.custom.fileinput;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.SequenceFileOutputFormat;


public class SmallDriver {
	public static void main(String[] args) throws Exception {
		args = new String[] {"E:\\hadoop_test\\input","E:\\hadoop_test\\output"};

		Configuration conf = new Configuration();

		Job job = Job.getInstance(conf);

		// 2指定jar包存放路径
		job.setJarByClass(SmallDriver.class);

		// 3关联map和reduce类
		job.setMapperClass(SmallMapper.class);
		job.setReducerClass(SmallReduce.class);

		// 4设置mapper阶段输出的k和v类型
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(BytesWritable.class);

		// 5设置最终输出的k和v类型
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(BytesWritable.class);

		/*
		 * 设置小文件打包切片模式 job.setInputFormatClass(CombineTextInputFormat.class);
		 * 设置小文件打包大小按128兆一个。 打包文件算法： 文件当前大小小于设定值，且下一个文件大于设定值，则单独打包为一块。
		 * 文件或被截取之后的剩余文件大于设定值，且小于2倍设定值时，将文件打包为2块，每块为文件的1/2
		 * CombineTextInputFormat.setMaxInputSplitSize(job, 134217728);
		 */

		// 设置mapper为键值对模式接收数据，
		// 默认为按行读取,FileInputFormat.class,key为本行的起始字符位置偏移量，value为行内容，不带换行符
		// job.setInputFormatClass(KeyValueTextInputFormat.class);
		job.setInputFormatClass(SmallFile.class);
		job.setOutputFormatClass(SequenceFileOutputFormat.class);

		// 6设置input和output的路径
		FileInputFormat.setInputPaths(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));

		// 7提交任务
		boolean waitForCompletion = job.waitForCompletion(true);
		System.exit(waitForCompletion ? 0 : 1);
	}
}
