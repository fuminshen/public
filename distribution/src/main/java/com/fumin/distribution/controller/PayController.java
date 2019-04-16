package com.fumin.distribution.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.service.OrderService;
import com.fumin.distribution.service.PayService;
import com.fumin.distribution.service.Service;
import com.fumin.distribution.service.impl.ClientServiceImpl;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Client;
import com.fumin.distribution.vo.Order;
import com.fumin.distribution.vo.Pay;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/pay")
public class PayController extends PageController<Pay> {

	@GetMapping("/new/{id}")
	public ModelAndView news(@PathVariable Long id) {
		Service<Order> os = getBean(OrderService.class);
		Order order = new Order();
		order.setId(id);
		order = os.get(order);
		if(order==null) {
			throw new IpcException("订单不存在");
		}
		
		Service<Client> cs = getBean(ClientServiceImpl.class);
		Client client = new Client();
		client.setId(order.getClientId());
		client = cs.get(client);
		if(client==null) {
			throw new IpcException("客户信息错误");
		}
		
		Calendar startCalendar = Calendar.getInstance();
		startCalendar.add(Calendar.MONTH, 3);
		Pay pay1 = new Pay();
		pay1.setOrderId(order.getId());
		
		//年利率8%，按4季返，每季返 x/100*8/4 = x/50 
		//保留一位小数=  取整(x/5)/10
		//pay1.setMoney( (double)Math.round(order.getMoney()/5)/10);
		pay1.setClientId(client.getId());
		pay1.setDueTime(new Timestamp( startCalendar.getTimeInMillis() ));
		
		Pay pay2 = new Pay();
		BeanUtils.copyProperties(pay1,pay2);
		startCalendar.add(Calendar.MONTH, 3);
		pay2.setDueTime(new Timestamp( startCalendar.getTimeInMillis() ));
		
		Pay pay3 = new Pay();
		BeanUtils.copyProperties(pay1,pay3);
		startCalendar.add(Calendar.MONTH, 3);
		pay3.setDueTime(new Timestamp( startCalendar.getTimeInMillis() ));
		
		Pay pay4 = new Pay();
		BeanUtils.copyProperties(pay1,pay4);
		startCalendar.add(Calendar.MONTH, 3);
		pay4.setDueTime(new Timestamp( startCalendar.getTimeInMillis() ));
		
		List<Pay> pays = new ArrayList<>();
		pays.add(pay1);
		pays.add(pay2);
		pays.add(pay3);
		pays.add(pay4);
		
		ModelAndView view = new ModelAndView("pay_info");
		view.addObject("order", order);
		view.addObject("client", client);
		view.addObject("pays", pays);
		return view;
	}
	
	@PostMapping("/add/l")
	@ResponseBody
	public String add(@RequestBody List<Pay> pays) {
		if(pays==null || pays.size()!=4) {
			throw new IpcException("数据错误");
		}
		((PayService)service).add(pays);
		return "{'state':'success'}";
	}
	
	@ResponseBody
	@RequestMapping("/list/today")
	public PageInfo<?> pageToday(Integer currePage, Integer pageSize, String sortName,
			String sortType) {
		Map<String, Object> map= new HashMap<String, Object>();
		
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		map.put("dueTime_end", calendar.getTime());
		map.put("state", 0);
		return super.page(map, currePage, pageSize, sortName, sortType);
	}
	
	@Override
	public boolean valid(Pay t) {
		if(t==null || t.getId()==null || t.getId()<=0) {
			throw new IpcException("数据错误");
		}
		if(t.getState()!=1) {
			throw new IpcException("非法的支付状态");
		}
		if(t.getAdminId()==null || t.getAdminId()<=0) {
			throw new IpcException("非法的操作人");
		}
		return true;
	}
	
	@Override
	public String update(Pay t) {
		t.setPayTime(new Timestamp(new Date().getTime()));
		//System.out.println(request.getHeader("Referer"));
		super.update(t);
		if(request.getParameter("url")==null || request.getParameter("url").trim().length()==0) {
			return "redirect:/pay/index";
		}else {
			return "redirect:"+request.getParameter("url");
		}
		
	}
	
}
