package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yihengtang.yihengtang.entity.Admin;
import com.yihengtang.yihengtang.entity.Make;

public interface AdminMapper {
	/**
	 * 轮播图地址
	 * @return
	 */
	@Select("select imgUrl from img where state = 1")
	List<String> imgUrl();
	/**
	 * 按账号密码查询管理员
	 * @param adminName
	 * @param password
	 * @return
	 */
	@Select("select * from admin where adminName = #{adminName} and password = #{password}")
	Admin admin(@Param("adminName")String adminName,@Param("password")String password);
	
	/**
	 * 修改密码
	 */
	@Update("update admin set password = #{password} where adminName = #{admin}")
	void password(@Param("password")String password,@Param("admin")String admin);
	
	/**
	 * 查询用户是否存在
	 * @param adminName
	 * @return
	 */
	@Select("select adminName from admin where adminName = #{adminName}")
	String adminName(String adminName);
	
	/**
	 * 后台查询预约
	 * @return
	 */
	@Select("SELECT e.name,u.nick_name, r.state,r.id from experts e, user u, reservation r WHERE e.id = r.e_id and u.id = r.u_id;")
	List<Make> yuyue();
	
	/**
	 * 接受预约
	 * @param treatmenttTime
	 * @param id
	 */
	@Update("UPDATE reservation set state = 1, treatmenttTime = #{treatmenttTime} where id= #{id}")
	void jieshouyuyue(@Param("treatmenttTime")String treatmenttTime,@Param("id")int id);
	
	/**
	 * 后台删除预约
	 * @param id
	 */
	@Delete("delete from reservation where id = #{id}")
	void shanchu(int id);
	
	
}
