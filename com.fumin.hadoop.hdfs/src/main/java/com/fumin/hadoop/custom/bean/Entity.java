package com.fumin.hadoop.custom.bean;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.Writable;

public class Entity implements Writable {

	private long key;
	private String value;
	public long getKey() {
		return key;
	}
	public void setKey(long key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Entity() {
	}
	@Override
	public String toString() {
		return key + "\t" + value;
	}
	public void write(DataOutput out) throws IOException {
		out.writeLong(key);
		out.writeUTF(value);
	}
	public void readFields(DataInput in) throws IOException {
		key = in.readLong();
		value = in.readUTF();
	}
	
	
}
