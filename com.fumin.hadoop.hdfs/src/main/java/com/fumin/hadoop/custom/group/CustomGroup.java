package com.fumin.hadoop.custom.group;

import org.apache.hadoop.io.WritableComparable;
import org.apache.hadoop.io.WritableComparator;

/**
 * 在归并排序的时候，分组
 * @author fm
 *
 */
public class CustomGroup extends WritableComparator {
	
	//必须提供空参构造，并必须传输对象的类和一个true
	public CustomGroup() {
		super(Bean.class,true);
	}

	@Override
	public int compare(WritableComparable a, WritableComparable b) {
		Bean aB = (Bean) a;
		Bean bB = (Bean) b;
		//int i=
		return Integer.parseInt(aB.getProductsId()) - Integer.parseInt(bB.getProductsId());
	}
}
