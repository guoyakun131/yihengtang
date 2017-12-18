package com.yihengtang.yihengtang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yihengtang.yihengtang.dao.AdminMapper;
import com.yihengtang.yihengtang.entity.Admin;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	/**
	 * 按用户名密码查询管理是否存在
	 * @param dminNmae
	 * @param password
	 * @return
	 */
	public Admin admin(String adminName,String password) {
		Admin admin = adminMapper.admin(adminName, password);
		if(admin == null) {
			return null;
		}
		return admin;
	}
}
