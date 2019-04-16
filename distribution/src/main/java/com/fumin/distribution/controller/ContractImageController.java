package com.fumin.distribution.controller;

import java.io.Serializable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.ContractImage;

@Controller
@RequestMapping("/contract/image/")
public class ContractImageController extends PageController<ContractImage> {

	@Override
	@ResponseBody
	public String add(ContractImage t) {
		super.add(t);
		return "{'state':'success','id':"+t.getId()+"}";
	}
	
	@Override
	@ResponseBody
	public String del(@RequestParam("id")Serializable id) {
		super.del(id);
		return "{'state':'success'}";
	}
	
	@Override
	public boolean valid(ContractImage t) {
		if(t.getContractId()==null) {
			throw new IpcException("合同信息错误");
		}
		if(t.getPath()==null) {
			throw new IpcException("图片路径错误");
		}
		return true;
	}

}
