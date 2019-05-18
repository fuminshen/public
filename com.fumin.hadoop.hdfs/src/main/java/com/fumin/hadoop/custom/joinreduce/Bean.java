package com.fumin.hadoop.custom.joinreduce;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;

import org.apache.hadoop.io.WritableComparable;

public class Bean implements WritableComparable<Bean> {
	private String id;
	private String ordersId;
	private String productsId;
	private String code;
	private int manufacturerid;
	private int count;
	private double price;
	private double cost;
	private String name;

	public void write(DataOutput out) throws IOException {
		out.writeUTF(id);
		out.writeUTF(ordersId);
		out.writeUTF(productsId);
		out.writeUTF(code);
		out.writeInt(manufacturerid);
		out.writeInt(count);
		out.writeDouble(price);
		out.writeDouble(cost);
		out.writeUTF(name);
	}

	public void readFields(DataInput in) throws IOException {
		id = in.readUTF();
		ordersId = in.readUTF();
		productsId = in.readUTF();
		code = in.readUTF();
		manufacturerid = in.readInt();
		count = in.readInt();
		price = in.readDouble();
		cost = in.readDouble();
		name = in.readUTF();
		
	}

	public int compareTo(Bean o) {
		int result = Integer.parseInt(this.getProductsId()) - Integer.parseInt(o.getProductsId());
		if(result == 0) {
			result = 0 - (int)Math.ceil(this.getPrice()-o.getPrice() );
		}
		return result;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(String ordersId) {
		this.ordersId = ordersId;
	}

	public String getProductsId() {
		return productsId;
	}

	public void setProductsId(String productsId) {
		this.productsId = productsId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getManufacturerid() {
		return manufacturerid;
	}

	public void setManufacturerid(int manufacturerid) {
		this.manufacturerid = manufacturerid;
	}
	
	public Bean() {
	}

	@Override
	public String toString() {
		return id + "\t" + ordersId + "\t" + productsId + "\t" + code
				+ "\t" + manufacturerid + "\t" + count + "\t" + price + "\t" + cost
				+ "\t" + name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


}
