package com.yihengtang.yihengtang.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yihengtang.yihengtang.dao.AdminMapper;
import com.yihengtang.yihengtang.dao.ImgMapper;
import com.yihengtang.yihengtang.entity.Admin;
import com.yihengtang.yihengtang.entity.Img;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private ImgMapper imgMapper;
	
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
	
	/**
	 * 查询轮播图
	 * @return
	 */
	public List<Img> img(){
		return imgMapper.img();
	}
	
	
}
