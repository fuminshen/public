package com.fumin.hadoop.custom.sort;

import java.io.IOException;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class Reduce extends Reducer<Entities, Entities, Text, Text> {

	Text v= new Text();
	Text k= new Text();
	@Override
	protected void reduce(Entities key, Iterable<Entities> values,Context context) throws IOException, InterruptedException {
		//names="";
		//int sum=0;
		for (Entities value : values) {
			//names+=value.getId()+",";
			//sum+=value.getId();
			v.set(value.toString());
			k.set(key.getId()+"");
			context.write(k, v);
		}
	}
}
