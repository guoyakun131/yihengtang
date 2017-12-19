package com.yihengtang.yihengtang.admin;

import java.util.HashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yihengtang.yihengtang.entity.Admin;
import com.yihengtang.yihengtang.service.AdminService;

/**
 * 管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping({"/admin"})
public class AdminController {

	@Autowired
	private AdminService adminService;
	/**
	 * 返回管理員登陸頁面
	 * @return
	 */
	@RequestMapping("/login")
	public String adminLogin() {
		return "admin/login";
	}	
	
	/**
	 * 管理员登陆处理
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String adminHome(HttpServletRequest request,Model model) {
		//管理员账号
		String adminName = request.getParameter("adminName");
		//管理员密码
		String password = request.getParameter("password");
		System.out.println(adminName+password);
		if(adminName.equals("") && password.equals("")) {
			System.out.println("用户名和密码不得为空");
			model.addAttribute("error", "用户名和密码不得为空！");
			return "admin/login";
		}
		Admin admin =adminService.admin(adminName, password);
		if(admin == null) {
			System.out.println("用户名或者密码错误");
			model.addAttribute("error", "用户名或者密码错误！");
			return "admin/login";
		}
		model.addAttribute("admin", admin.getAdminName());
		System.out.println("成功");
		return "admin/home";
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping("/logout")
	public String adminLogout() {
		return "admin/login";
	}	
	
	@RequestMapping("/pass")
	public String pass(HttpServletRequest request,Model model) {
		
		return "admin/login";
	}	
}
