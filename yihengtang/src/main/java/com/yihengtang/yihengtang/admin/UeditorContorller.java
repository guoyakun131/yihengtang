package com.yihengtang.yihengtang.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class UeditorContorller {
	@RequestMapping("/ueditor")
	@ResponseBody
	 public String config(HttpServletRequest request,HttpServletResponse response){
//	        String rootPath=request.getServletContext().getRealPath("/");
//	        System.out.println(rootPath);
//	        return new ActionEnter( request, rootPath).exec();
		String s = "{\n"+
		           "            \"imageActionName\": \"uploadimage\",\n" +
		           "                \"imageFieldName\": \"file\", \n" +
		           "                \"imageMaxSize\": 2048000, \n" +
		           "                \"imageAllowFiles\": [\".png\", \".jpg\", \".jpeg\", \".gif\", \".bmp\"], \n" +
		           "                \"imageCompressEnable\": true, \n" +
		           "                \"imageCompressBorder\": 1600, \n" +
		           "                \"imageInsertAlign\": \"none\", \n" +
		           "                \"imageUrlPrefix\": \"\",\n" +
		           "                \"imagePathFormat\": \"/ueditor/jsp/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}\" }";
		    return s;
	    }
	
	
}
