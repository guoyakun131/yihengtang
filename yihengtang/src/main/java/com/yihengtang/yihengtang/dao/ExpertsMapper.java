package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yihengtang.yihengtang.entity.Experts;

/**
 * 
 * @author 郭亚坤
 *
 */
@Mapper
public interface ExpertsMapper {
	/**
	 * 后台查询医师列表
	 * @return
	 */
	@Select("SELECT e.id,e.name,e.gender,d.department,e.position,e.profile,e.amount,e.location,e.kanzhenshijian,e.profiles,e.img,e.addtime FROM experts e,department d WHERE e.department_id = d.id")
	List<Experts> adminFindAll();
	
	/**
	 * 后台查询编辑医生信息
	 * @param id
	 * @return
	 */
	@Select("SELECT e.id,e.name,e.gender,d.department,e.position,e.profile,e.amount,e.location,e.locations,e.kanzhenshijian,e.img,e.profiles from experts e, department d where e.department_id = d.id and e.id = #{id}")
	Experts adminFindById(int id);
	
	@Delete("delete from experts where id = #{id}")
	void expertsDel(int id);
	/**
	 * 按ID查询专家
	 * @return
	 */
	@Select("select * from experts where id = #{e_id}")
	Experts findExpertsByID(int e_id);
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
	/**
	 * 查询某部门的所有医生
	 * @param department
	 * @return
	 */
	@Select("SELECT * from experts,department WHERE experts.department_id = department.id and department.department=#{department}")
	List<Experts> expertsClassify(String department);
	
	@Update ("update experts set numberOfPatients= numberOfPatients + 1 where id = #{id}")
	int numberOfPatients(int id);
	
	/**
	 * 添加医师
	 */
	@Insert("INSERT INTO experts (name,gender,position,profile,profiles,kanzhenshijian,location,locations,amount,img,department_id,quantity,numberOfPatients,addtime)\r\n" + 
			"VAlUES(#{name},#{gender},#{position},#{profile},#{profiles},#{kanzhenshijian},#{location},#{locations},#{amount},#{img},#{department_id},0,0,NOW())")
	void expertsAdd(@Param("name")String name,@Param("gender")String gender,@Param("position")String position,
			@Param("profile")String profile,@Param("profiles")String profiles,@Param("kanzhenshijian")String kanzhenshijian,
			@Param("location")String location,@Param("locations")String locations,@Param("amount")String amount,
			@Param("img")String img,@Param("department_id")int department_id
			);
	
	/**
	 * 编辑医师
	 * @param name
	 * @param gender
	 * @param position
	 * @param profile
	 * @param profiles
	 * @param kanzhenshijian
	 * @param location
	 * @param locations
	 * @param amount
	 * @param img
	 * @param department_id
	 * @param id
	 */
	@Update("UPDATE experts SET NAME = #{name},gender = #{gender},position = #{position},PROFILE = #{profile},"
			+ "PROFILES = #{profiles},kanzhenshijian = #{kanzhenshijian},location = #{location},locations = #{locations}, "
			+ "amount = #{amount},img = #{img},department_id = #{department_id},"
			+ "addtime = NOW() where id = #{id}")
	void expertsEditor(@Param("name")String name,@Param("gender")String gender,@Param("position")String position,
			@Param("profile")String profile,@Param("profiles")String profiles,@Param("kanzhenshijian")String kanzhenshijian,
			@Param("location")String location,@Param("locations")String locations,@Param("amount")String amount,
			@Param("img")String img,@Param("department_id")int department_id,@Param("id")int id);
	
	/**
	 * 编辑医师不更改头像
	 * @param name
	 * @param gender
	 * @param position
	 * @param profile
	 * @param profiles
	 * @param kanzhenshijian
	 * @param location
	 * @param locations
	 * @param amount
	 * @param img
	 * @param department_id
	 * @param id
	 */
	@Update("UPDATE experts SET NAME = #{name},gender = #{gender},position = #{position},PROFILE = #{profile},"
			+ "PROFILES = #{profiles},kanzhenshijian = #{kanzhenshijian},location = #{location},locations = #{locations}, "
			+ "amount = #{amount},department_id = #{department_id},"
			+ "addtime = NOW() where id = #{id}")
	void expertsEditorNoImg(@Param("name")String name,@Param("gender")String gender,@Param("position")String position,
			@Param("profile")String profile,@Param("profiles")String profiles,@Param("kanzhenshijian")String kanzhenshijian,
			@Param("location")String location,@Param("locations")String locations,@Param("amount")String amount,
			@Param("department_id")int department_id,@Param("id")int id);
}
