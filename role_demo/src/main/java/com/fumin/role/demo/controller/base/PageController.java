package com.fumin.role.demo.controller.base;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.role.demo.util.FmException;
import com.github.pagehelper.PageInfo;

public abstract class PageController<T> extends SuperController<T> {
	private String controllerName;
	private String className;

	/**
	 * 数据验证函数，在新增和编辑的时候会执行检测
	 * @param t
	 * @return
	 */
	public abstract boolean valid(T t);
	
	@PostMapping("/add")
	public String add(T t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(!valid(t)) {
			throw new FmException("数据验证失败"); 
		}
		service.add(t);
		return "redirect:/"+controllerName+"/index";
	}
	
	@GetMapping("index")
	public String index() {
		return controllerName+"_index";
	}
	
	@GetMapping("/new")
	public String news() {
		return controllerName+"_info";
	}
	
	@PostMapping("/update")
	public String update(T t) {
		if(t==null) {
			throw new FmException("数据为空");
		}
		if(!valid(t)) {
			throw new FmException("数据验证失败"); 
		}
		service.update(t);
		return "redirect:/"+controllerName+"/index";
	}
	
	@PostMapping("/delete")
	public String del(@RequestParam("id")Serializable id) {
		service.delete(id);
		return "redirect:/"+controllerName+"/index";
	}
	
	@GetMapping("/get/{id}")
	public ModelAndView get(@PathVariable("id")Serializable id) {
		Object o = service.get(id);
		if(o==null) {
			throw new FmException("数据不存在");
		}
		ModelAndView model=new ModelAndView(controllerName+"_info");
		model.addObject("vo",o);
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public PageInfo<?> page(
			@RequestParam(value="map",required=false)Map<String, Object> entity,
			@RequestParam(value="page",required=false)Integer currePage,
			@RequestParam(value="rows",required=false)Integer pageSize,
			@RequestParam(value="sidx",required=false)String sortName,
			@RequestParam(value="sord",required=false)String sortType) {
		if(currePage==null) {
			currePage=0;
		}
		if(pageSize==null) {
			pageSize=50;
		}
		if( !StringUtils.isEmpty(sortName) ) {
			if(entity==null) {
				entity = new HashMap<>();
			}
			entity.put("ORDER_BY", sortName+" "+sortType);
		}
		return service.getPageToMap(entity, currePage, pageSize);
	}
	
	@RequestMapping("/modal")
	public ModelAndView modalList(ModelAndView model){
		model.addObject("isModal", true);
		model.setViewName(controllerName+"_index");
		return model;
	}
	
	public PageController() {
		Type genType = getClass().getGenericSuperclass();  
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();  
        className=params[0].getTypeName();
        controllerName=className.substring(className.lastIndexOf(".")+1).toLowerCase();
	}
	
	protected boolean isAddAction() {
		String action=request.getServletPath();
		action=action.substring(action.lastIndexOf("/")+1);
		if(action.equals("add")) {
			return true;
		}else {
			return false;
		}
	}
}
