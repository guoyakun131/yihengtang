package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.yihengtang.yihengtang.entity.Articles;


/**
 * 首页文章Dao接口
 * @author Administrator
 *
 */
@Mapper
public interface ArticlesMapper {

	/**
	 * 查询文章信息
	 * @return
	 */
	@Select("select details,time,FabulousInt,browseInt,img,type from articles")
	List<Articles> findAll();
	
	
}
