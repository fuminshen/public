package com.fumin.hadoop.custom.outputformat;

import java.io.IOException;

import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.RecordWriter;
import org.apache.hadoop.mapreduce.TaskAttemptContext;

public class CustomRecordWriter extends RecordWriter<Text, IntWritable> {
	private FSDataOutputStream fos;
	FileSystem fs;
	int count = 0;
	
	public CustomRecordWriter(TaskAttemptContext job){
		try {
			fs = FileSystem.newInstance(job.getConfiguration());
			fos = fs.create(new Path("E:/hadoop_test/customfile.txt"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void write(Text key, IntWritable value) throws IOException, InterruptedException {
		count++;
		fos.write(String.valueOf(count).getBytes());
		fos.write(".[".getBytes());
		fos.write(key.toString().getBytes());
		fos.write("] ".getBytes());
		fos.write(value.toString().getBytes());
		fos.write("\r\n".toString().getBytes());
	}

	@Override
	public void close(TaskAttemptContext context) throws IOException, InterruptedException {
		IOUtils.closeStream(fos);
		fs.close();
	}

}
