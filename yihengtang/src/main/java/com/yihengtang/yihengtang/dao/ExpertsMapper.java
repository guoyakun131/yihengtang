package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.yihengtang.yihengtang.entity.Experts;

/**
 * 
 * @author 郭亚坤
 *
 */
@Mapper
public interface ExpertsMapper {

	/**
	 * 查询专家Id
	 * @return
	 */
//	@Select("select id from experts")
//	int experts();
	
	/**
	 * 按专家名字查询
	 * @param name
	 * @return
	 */
	@Select("select * from experts where name = #{name}")
	Experts findExpertsByName(@Param("name")String name);
	
	/** 
	 * 查询所有
	 * @return
	 */
	@Select("select * from experts")
	List<Experts> findAll();
	
	/**
	 * 查询专家数量
	 * @return 
	 */
	@Select("select  count(*)from experts")
	int expertsQuantity();
	
	/**
	 * 查询專家就診數量
	 * @return 
	 */
	@Select("select SUM(quantity) from experts where quantity")
	int quantity();
	
	@Select("SELECT * from experts,department WHERE experts.department_id = department.experts_id and department.department=#{department}")
	List<Experts> expertsClassify(String department);
}
