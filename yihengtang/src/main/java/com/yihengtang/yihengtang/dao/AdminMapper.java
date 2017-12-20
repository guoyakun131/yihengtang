package com.yihengtang.yihengtang.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.yihengtang.yihengtang.entity.Admin;

public interface AdminMapper {

	/**
	 * 按账号密码查询管理员
	 * @param adminName
	 * @param password
	 * @return
	 */
	@Select("select * from admin where adminName = #{adminName} and password = #{password}")
	Admin admin(@Param("adminName")String adminName,@Param("password")String password);
}