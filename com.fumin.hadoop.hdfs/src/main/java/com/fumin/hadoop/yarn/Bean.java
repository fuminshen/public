package com.fumin.hadoop.yarn;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.sql.Timestamp;

import org.apache.hadoop.io.Writable;

public class Bean implements Writable,Comparable<Bean> {
	private int id;
	private String name;
	private Timestamp time;

	public void write(DataOutput out) throws IOException {
		// TODO Auto-generated method stub
		out.writeInt(id);
		out.writeUTF(name);
		out.writeLong(time.getTime());
	}

	public void readFields(DataInput in) throws IOException {
		// TODO Auto-generated method stub
		id = in.readInt();
		name = in.readUTF();
		time = new Timestamp(in.readLong());
		
	}

	public int compareTo(Bean bean) {
		
		return this.id > bean.id?-1:1;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return id + "\t" + name + "\t" + time;
	}
	
}
