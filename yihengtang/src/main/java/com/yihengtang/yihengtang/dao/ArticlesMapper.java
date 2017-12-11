package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	@Select("select details,time,FabulousInt,browseInt,img,type,text from articles")
	List<Articles> findAll();
	
	/**
	 * 增加阅读数量
	 * @return
	 */
	@Update ("update articles set browseInt= browseInt + 1 where id = #{id}")
	void read(int id);
}
