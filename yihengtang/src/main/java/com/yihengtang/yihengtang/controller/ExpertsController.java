package com.yihengtang.yihengtang.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yihengtang.yihengtang.dao.ExpertsMapper;
import com.yihengtang.yihengtang.entity.Experts;
import com.yihengtang.yihengtang.service.ExpertsService;

/**
 * 专家Controller
 * @author 郭亚坤
 * @version 1.0.0
 */
@RestController
@RequestMapping({"/experts"})
public class ExpertsController {
	
	@Autowired
	private ExpertsService expertsService;
	
	@Autowired
	private ExpertsMapper expertsMapper;
	
	/**
	 * 按专家名字查询
	 * @param name
	 * @return
	 */
	@RequestMapping("/name")
	public Experts exprtsByName(String name) {
		 Experts experts = expertsMapper.findExpertsByName(name);
		System.out.println(experts);
		return experts;
	}
	
	@RequestMapping("/expertsAll")
	public List<Experts> expertsAll() {
		List<Experts>lists= expertsMapper.findAll();
		System.out.println(lists);
		return lists;
	}
	
	/**
	 * 查询就诊数量
	 * @return
	 */
	@RequestMapping("/quantity")
	public int quantity() {
		int o =expertsMapper.quantity();
 		return o;
	}

	/**
	 * 查询专家数量
	 * @return
	 */
	@RequestMapping("/expertsQuantity")
	public int expertsQuantity() {
		int i = expertsMapper.expertsQuantity();
 		return i;
	}
	
	/**
	 * 按科室查询医生信息
	 * @param department
	 * @return
	 */
	@RequestMapping("/expertsClassify")
	public List<Experts> expertsClassify(String department){
		System.out.println(department);
		return expertsService.expertsClassify(department);
	}
}
