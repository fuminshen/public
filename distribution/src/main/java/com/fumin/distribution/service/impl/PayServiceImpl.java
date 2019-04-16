package com.fumin.distribution.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fumin.distribution.service.OrderService;
import com.fumin.distribution.service.PayService;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Admin;
import com.fumin.distribution.vo.Order;
import com.fumin.distribution.vo.Pay;

@Service
@Transactional
public class PayServiceImpl extends ServiceImpl<Pay> implements PayService {

	public boolean add(List<Pay> pays) {
		Admin admin = AdminServiceImpl.getCurrentUser();
		
		OrderService os = (OrderService) getService(OrderService.class);
		Order order = new Order();
		order.setId(pays.get(0).getOrderId());
		order = os.get(order);
		if(order==null) {
			throw new IpcException("订单信息错误");
		}
		
		for(Pay pay:pays) {
			pay.setCompanyId(admin.getCompanyId());
			pay.setState(0);
			if(dao.add(pay)==0) {
				throw new IpcException("数据添加失败，请稍后再试");
			}
		}
		
		os.update(order);
		return true;
	}
}
