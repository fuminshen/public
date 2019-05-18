package com.fumin.hadoop.custom.sort;

import org.apache.hadoop.mapreduce.Partitioner;

public class CustomPartition extends Partitioner<Entities, Entities>{

	@Override
	public int getPartition(Entities key, Entities value, int numPartitions) {
		int id=key.getId();
		int partition;
		if(id<30) {
			partition=0;
		}else if(id>=30 && id<60) {
			partition=1;
		}else if(id>=60 && id<100) {
			partition=2;
		}else {
			partition=3;
		}
		return partition;
	}

}
