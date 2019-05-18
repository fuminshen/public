package com.fumin.hadoop.custom.partition;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Partitioner;

public class CustomPartition extends Partitioner<LongWritable, Entities> {

	@Override
	public int getPartition(LongWritable key, Entities value, int numPartitions) {
		long k = key.get();
		int partition=0;
		if(k>30 && k<60) {
			partition=1;
		}
		else if(k>=60 && k<100) {
			partition=2;
		}else if(k>=100){
			partition=3;
		}
		return partition;
	}

}
