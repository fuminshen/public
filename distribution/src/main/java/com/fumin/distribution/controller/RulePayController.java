package com.fumin.distribution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.RulePay;

@Controller
@RequestMapping("/rulepay")
public class RulePayController extends PageController<RulePay> {

	@Override
	public boolean valid(RulePay t) {
		if(t.getCount()==null || t.getCount()<=0) {
			throw new IpcException("销售指标不能为空");
		}
		if(t.getMoney()==null || t.getMoney()<=0) {
			throw new IpcException("提成金额不能为空");
		}
		return true;
	}
}
