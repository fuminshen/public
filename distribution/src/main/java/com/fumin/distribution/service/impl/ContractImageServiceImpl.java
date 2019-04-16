package com.fumin.distribution.service.impl;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.fumin.distribution.util.IpcException;
import com.fumin.distribution.vo.ContractImage;

@Service
@Transactional
public class ContractImageServiceImpl extends ServiceImpl<ContractImage> {
	@Value("${config.uploadpath}")
	private String uploadPath;
	
	@Override
	public boolean delete(ContractImage vo) {
		if(vo==null || vo.getId()==null) {
			throw new IpcException("非法的删除操作");
		}
		if(vo.getPath()==null || vo.getPath().trim().length()==0) {
			vo = get(vo);
		}
		String path=getRootPath()+vo.getPath();
		File file = new File(path);
		if(file.exists()) {
			file.delete();
		}
		return super.delete(vo);
	}
	
	private String getRootPath() {
		if(uploadPath.equals("/")) {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			return request.getServletContext().getRealPath("/");
		}else {
			return uploadPath+"/";
		}
	}
}
