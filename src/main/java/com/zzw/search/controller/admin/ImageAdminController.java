package com.zzw.search.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/admin/image")
public class ImageAdminController {

	@RequestMapping(value = "/upload.do", method=RequestMethod.GET)
	public String toUpload(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		return "admin/image/upload";
	}
	
	@RequestMapping(value = "/upload.do", method=RequestMethod.POST)
	public String upload(HttpServletRequest req, HttpServletResponse resp, MultipartFile imageFile) throws IOException {
		if (imageFile == null || "".equals(imageFile.getOriginalFilename())) {
			resp.getWriter().write("{\"status\": -1}");
			return null;
		}
		// 获取文件保存路径
		String path = req.getSession().getServletContext().getRealPath("upload");
		// 获取文件后缀
		String suffix = imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
		// 保存文件名
		String fileName = UUID.randomUUID().toString() + suffix;
		File pathFile = new File(path, fileName);
		if (!pathFile.exists()) {
			pathFile.mkdirs();
		}
		imageFile.transferTo(pathFile);
		JSONObject result = new JSONObject();
		result.put("status", 0);
		result.put("fileUrl", req.getContextPath() + "/upload/" + fileName);
		resp.getWriter().write(result.toJSONString());
		return null;
	}
	
}
