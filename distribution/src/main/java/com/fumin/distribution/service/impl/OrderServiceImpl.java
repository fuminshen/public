package com.fumin.distribution.service.impl;

import java.math.BigDecimal;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fumin.distribution.service.ClientService;
import com.fumin.distribution.service.OrderService;
import com.fumin.distribution.service.PayService;
import com.fumin.distribution.service.ProductService;
import com.fumin.distribution.service.RulePayService;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Client;
import com.fumin.distribution.vo.Order;
import com.fumin.distribution.vo.Pay;
import com.fumin.distribution.vo.Product;
import com.fumin.distribution.vo.RulePay;

@Service
@Transactional
public class OrderServiceImpl extends ServiceImpl<Order> implements OrderService {

	@Override
	public boolean add(Order order) {
		order.setNumber(Order.createOrderNumber());
		PayService ps = getService(PayService.class);
		ProductService prs = getService(ProductService.class);
		ClientService cs = getService(ClientService.class);
		
		Product product = new Product();
		product.setId(order.getProductId());
		product = prs.get(product);
		
		order.setPrice(product.getPrice());
		order.setMoney(order.getPrice().multiply(new BigDecimal( order.getCount()) ) );
		if(!super.add(order)) {
			throw new IpcException("下订单失败，请稍后再试");
		}
		
		//------获取销售商品的代理商
		Client client = new Client();
		client.setId(order.getClientId());
		client = cs.get(client);
		//-------分配销售佣金
		Pay pay1 = new Pay();
		pay1.setClientId(client.getId());
		pay1.setOrderId(order.getId());
		pay1.setCompanyId(0);
		pay1.setState(1);
		pay1.setMoney(product.getPayCommission() * order.getCount());
		if( !ps.add(pay1) ) {
			throw new IpcException("销售佣金分配出现一个错误，订单被取消");
		}

		//---------如果销售的代理商有上级则开始分配推广佣金
		if(client.getParentId()!=null && client.getParentId()>0) {
			Client parent = new Client();
			parent.setId(client.getParentId());
			parent = cs.get(parent);
			//-------分配推广佣金
			Pay pay2 = new Pay();
			pay2.setClientId(parent.getId());
			pay2.setOrderId(order.getId());
			pay2.setCompanyId(0);
			pay2.setState(2);
			//--------如果商品没有设置推广佣金的金额，则使用默认的金额500元作为推广佣金
			double money = (product.getAdCommission()==null || product.getAdCommission()<=0)?500d:product.getAdCommission();
			pay2.setMoney(money * order.getCount());
			if( !ps.add(pay2) ) {
				throw new IpcException("推广佣金分配出现一个错误，订单被取消");
			}
			
			//---------如果存在第三上级则开始分配激励佣金
			if(parent.getParentId()!=null && parent.getParentId()>0) {
				Client parent1 = new Client();
				parent1.setId(parent.getParentId());
				parent1 = cs.get(parent1);
				
				//-------读取激励佣金的金额
				double payMoney = getPayMoney(parent1.getSellCount(),order.getCount());
				//-------激励佣金的金额大于0则开始分配，
				//-------否则说明该代理商的销售量已经超出获得佣金的规则，无法再获得佣金
				if(payMoney>0) {
					Pay pay3 = new Pay();
					pay3.setClientId(parent1.getId());
					pay3.setOrderId(order.getId());
					pay3.setCompanyId(0);
					pay3.setState(3);
					pay3.setMoney(payMoney);
					if( !ps.add(pay3) ) {
						throw new IpcException("激励佣金分配出现一个错误，订单被取消");
					}
				}
				
				//-----------修改代理商销售的数量
				parent1.setSellCount(parent1.getSellCount()+order.getCount());
				if( !cs.update(parent1) ) {
					throw new IpcException("销售数量更新失败，订单被取消");
				}
			}
		}
		
		return true;
	}
	
	private double getPayMoney(int start,int count) {
		//---------根据激励佣金规则获取金额
		double money=0;
		count--;
		start+=1;
		RulePayService rps = getService(RulePayService.class);
		//-------根据激励佣金规则获取金额
		RulePay rulePay = rps.getCurrentByCount(start);
		while(count>=0) {
			if(rulePay==null) {
				break;
			}
			if(start<=rulePay.getCount()) {
				money+=rulePay.getMoney();
			}else {
				rulePay = rps.getCurrentByCount(start);
				money+=rulePay.getMoney();
			}
			count--;
			start+=1;
		}
		return money;
	}
}
