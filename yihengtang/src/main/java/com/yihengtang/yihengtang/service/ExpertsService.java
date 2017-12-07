package com.yihengtang.yihengtang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yihengtang.yihengtang.dao.ExpertsMapper;
import com.yihengtang.yihengtang.entity.Experts;

@Service
public class ExpertsService {

	@Autowired
	private ExpertsMapper expertsMapper;
	/**
	 * 按名字查询专家信息
	 * @param name
	 * @return
	 */
	public Experts findName(String name) {
		 return expertsMapper.findExpertsByName(name);
	}
	/**
	 * 查询专家数量
	 * @return
	 */
	public int expertsQuantity() {
		 return expertsMapper.expertsQuantity();
	}
	/**
	 * 按科室查询医生信息
	 * @param department
	 * @return
	 */
	public List<Experts> expertsClassify(String department){
		return expertsMapper.expertsClassify(department);
	}
	
	
}
