package com.fumin.distribution.controller.base;

import java.io.Serializable;
import java.lang.reflect.*;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.fumin.distribution.controller.base.SuperBaseControllor;
import com.fumin.distribution.util.IpcException;
import com.github.pagehelper.PageInfo;

public abstract class PageController<T> extends SuperBaseControllor<T> {
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
			throw new IpcException("数据为空");
		}
		if(!valid(t)) {
			throw new IpcException("数据验证失败"); 
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
			throw new IpcException("数据为空");
		}
		if(!valid(t)) {
			throw new IpcException("数据验证失败"); 
		}
		if(service.update(t)) {
			return "redirect:/"+controllerName+"/index";
		}else {
			throw new IpcException("编辑失败");
		}
	}
	
	@PostMapping("/delete")
	public String del(@RequestParam("id")Serializable id) {
		T t=newEntity();
		try {
			setId(t,id);
			if(service.delete(t)) {
				return "redirect:/"+controllerName+"/index";
			}
			throw new IpcException("删除失败");
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	@GetMapping("/get/{id}")
	public ModelAndView get(@PathVariable("id")Serializable id) {
		T t=newEntity();
		try {
			setId(t,id);
			t=service.get(t);
			if(t==null) {
				throw new IpcException("数据不存在");
			}
			ModelAndView model=new ModelAndView(controllerName+"_info");
			model.addObject("vo",t);
			return model;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	@ResponseBody
	@RequestMapping("/list")
	public PageInfo<?> page(
			@RequestParam(value="map",required=false)Map<String,Object> map,
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
		if(sortName!=null && sortName.trim().length()>0) {
			if(map==null) {
				map=new HashMap<String,Object>();
			}
			map.put("orderByName", sortName+" "+sortType);
		}
		return service.getPager(map, currePage, pageSize);
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
	
	private T newEntity() {
		try {
			@SuppressWarnings("unchecked")
			Class<T> c=(Class<T>) Class.forName(className);
			return c.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	private void setId(T t,Serializable id) throws Exception {
		Field field=t.getClass().getDeclaredField("id");
		field.setAccessible(true);
		if(field.getType() == Integer.class) {
			field.set(t, Integer.valueOf(id.toString()) );
		}else if(field.getType() == Long.class) {
			field.set(t,Long.valueOf(id.toString()) );
		}else {
			field.set(t,id);
		}
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
