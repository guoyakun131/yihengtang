package com.yihengtang.yihengtang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yihengtang.yihengtang.dao.ArticlesMapper;
import com.yihengtang.yihengtang.entity.Articles;


@Service
public class HomeService {

	@Autowired
	private ArticlesMapper wenZhangMapper;
	
	/**
	 * 查询文章信息
	 * @return
	 */
	public List<Articles> chaXunWenZhang(){
		return wenZhangMapper.findAll();
	}

	/**
	 * 按文章ID增加阅读数量
	 * @param id
	 */
	public void read(int id) {
		wenZhangMapper.read(id);
	}
}
