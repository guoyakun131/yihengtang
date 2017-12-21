package com.yihengtang.yihengtang.admin;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yihengtang.yihengtang.dao.ArticlesMapper;
import com.yihengtang.yihengtang.entity.Admin;
import com.yihengtang.yihengtang.entity.Articles;
import com.yihengtang.yihengtang.entity.User;
import com.yihengtang.yihengtang.service.AdminService;
import com.yihengtang.yihengtang.service.UserService;

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
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ArticlesMapper articlesMapper;
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
	@RequestMapping(value = "/index", method = RequestMethod.POST)
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
		return "admin/index";
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
	
	/**
	 * 所有用户信息
	 * @return
	 */
	@RequestMapping("/user-list")
	public  String userList(Model model) {
		List<User> userList =  userService.userList();
		model.addAttribute("userList", userList);
		return "admin/user-list";
	}	
	
	/**
	 * 图文上传
	 * @return
	 */
	@RequestMapping("/picture")
	public String picture(Model model) {
		List<Articles> articlesList =  articlesMapper.articlesList();
		model.addAttribute("articlesList", articlesList);
		model.addAttribute("articlesSize", articlesList.size());
		return "admin/picture";
	}	
}
