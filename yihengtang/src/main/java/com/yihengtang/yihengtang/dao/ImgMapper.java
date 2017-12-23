package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.yihengtang.yihengtang.entity.Img;

public interface ImgMapper {

	/**
	 * 查询轮播图
	 * @return
	 */
	@Select("select * from img")
	List<Img> img();
}
