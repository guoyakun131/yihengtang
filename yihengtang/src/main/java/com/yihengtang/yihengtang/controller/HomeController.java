package com.yihengtang.yihengtang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yihengtang.yihengtang.dao.ArticlesMapper;
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
	
	@Autowired
	private ArticlesMapper articlesMapper;
	
	@RequestMapping("/wenzhang")
	public Map<String, List<Articles>> homeWenZhang() {
		Map<String,List<Articles>> map = new HashMap<String,List<Articles>>();
		map.put("a", articlesMapper.findAll1());
		map.put("b", articlesMapper.findAll2());
		map.put("c", articlesMapper.findAll3());
		map.put("d", articlesMapper.findAll4());
		map.put("e", articlesMapper.findAll5());
		return map;
	}
	
	/**
	 * 按ID查询文章
	 * @param id
	 * @return
	 */
	@RequestMapping("/articles")
	public Articles articles(int id) {
		return articlesMapper.findById(id);
	}
	
	/**
	 * 阅读量加1
	 * @param id
	 */
	@RequestMapping("/read")
	public void read(int id) {
		homeServce.read(id);
	}
}
