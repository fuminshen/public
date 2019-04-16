package com.fumin.distribution.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fumin.distribution.controller.base.BaseController;

@Controller
@RequestMapping("/f")
public class FileController extends BaseController {
	@Value("${config.uploadpath}")
	private String uploadPath;

	@PostMapping("/d")
	@ResponseBody
	public String delete(@RequestParam("path") String path) {
		path=getRootPath()+path;
		File file = new File(path);
		if(file.exists()) {
			file.delete();
		}
		return "success";
	}
	
	private String getRootPath() {
		if(uploadPath.equals("/")) {
			return request.getServletContext().getRealPath("/");
		}else {
			return uploadPath+"/";
		}
	}
	
}
