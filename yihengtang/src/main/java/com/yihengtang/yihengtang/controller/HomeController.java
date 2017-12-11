package com.yihengtang.yihengtang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yihengtang.yihengtang.entity.Articles;
import com.yihengtang.yihengtang.service.HomeService;

/**
 * 处理首页的Controller
 * @author Administrator
 *
 */
@RestController
@RequestMapping({"/home"})
public class HomeController {

	@Autowired
	private HomeService homeServce;
	
	@RequestMapping("/wenzhang")
	public List<Articles> homeWenZhang() {
		return homeServce.chaXunWenZhang();
	}
	
	@RequestMapping("/read")
	public void read(int id) {
		homeServce.read(id);
	}
}
