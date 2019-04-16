package com.fumin.distribution.controller;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.distribution.controller.base.PageController;
import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.Contract;
import com.fumin.distribution.vo.Order;

@Controller
@RequestMapping("/contract")
public class ContractController extends PageController<Contract> {

	@Value("${config.uploadpath}")
	private String uploadPath;
	
	@Override
	@ResponseBody
	public String add(Contract t) {
		t.setNumber(Contract.createContractNumber());
		super.add(t);
		return "{'state':'success','id':"+t.getId()+"}";
	}
	
	@GetMapping("/new/{id}")
	public String news(@PathVariable("id") Long id,ModelAndView model) {
		Contract c=new Contract();
		c.setOrderId(id);
		request.setAttribute("vo", c);
		return super.news();
	}
	
	@Override
	@ResponseBody
	public String del(@RequestParam("id")Serializable id) {
		super.del(id);
		return "{'state':'success'}";
	}
	
	@Override
	public boolean valid(Contract t) {
		if(t.getOrderId()==null) {
			throw new IpcException("合同关联的订单信息错误");
		}
		return true;
	}
	
	@ResponseBody
	@PostMapping("/upload")
	public String upload(MultipartFile file) {
		if (file==null || file.isEmpty()) {
            return "{'state':'1','msg':'上传失败，请选择文件'}";
        }
		String fileName = file.getOriginalFilename();
		fileName = Order.createOrderNumber() + fileName.substring(fileName.lastIndexOf('.'));
        String filePath;
        
        if(uploadPath.equals("/")) {
			filePath=request.getServletContext().getRealPath("/upload/contract/");
		}else {
			filePath=uploadPath+"/upload/contract/";
		}
        
        //System.out.println(filePath);
        File dest = new File(filePath+fileName);
        if(!dest.getParentFile().exists()) {
        	dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
            return "{'state':'0','msg':'"+fileName+"'}";
        } catch (IOException e) {
        	e.printStackTrace();
            return "{'state':'1','msg':'"+e.getMessage()+"'}";
        }
	}
}
