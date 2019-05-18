package com.fumin.hadoop.custom.partition;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.Writable;

public class Entities implements Writable {

	private int id;
	private String name;
	private int count;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void write(DataOutput out) throws IOException {
		out.writeInt(id);
		out.writeUTF(name);
		out.writeInt(count);
	}
	public void readFields(DataInput in) throws IOException {
		id=in.readInt();
		name=in.readUTF();
		count=in.readInt();
	}
	@Override
	public String toString() {
		return id + "\t" + name + "\t" + count;
	}
	
}
