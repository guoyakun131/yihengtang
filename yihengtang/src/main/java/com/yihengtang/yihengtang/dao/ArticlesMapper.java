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
	
	@Select("select id,details,type,author,time,browseInt from articles")
	List<Articles> articlesList();
	
	/**
	 * 按Id查询文章信息
	 * @param id
	 * @return
	 */
	@Select("select details,author,time,text,img from articles where id =#{id}")
	Articles findById(int id);
	/**
	 * 查询文章信息
	 * @return
	 */
	@Select("select id,details,time,FabulousInt,browseInt,img,type from articles where type = 1")
	List<Articles> findAll1();
	
	@Select("select id,details,time,FabulousInt,browseInt,img,type from articles where type = 2")
	List<Articles> findAll2();
	
	@Select("select id,details,time,FabulousInt,browseInt,img,type from articles where type = 3")
	List<Articles> findAll3();
	
	@Select("select id,details,time,FabulousInt,browseInt,img,type from articles where type = 4")
	List<Articles> findAll4();
	
	@Select("select id,details,time,FabulousInt,browseInt,img,type from articles where type = 5")
	List<Articles> findAll5();
	
	/**
	 * 增加阅读数量
	 * @return
	 */
	@Update ("update articles set browseInt= browseInt + 1 where id = #{id}")
	void read(int id);
}
