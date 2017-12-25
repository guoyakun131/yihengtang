package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
	 * 添加图文
	 * @param details
	 * @param type
	 * @param img
	 * @param text
	 * @param author
	 */
	@Insert("INSERT INTO articles (details,time,img,type,text,author) VALUES (#{details},NOW(),#{img},#{type},#{text},#{author})")
	void addArticles(@Param("details")String details,@Param("img")String img,@Param("type")int type,@Param("text")String text,@Param("author")String author);
	/**
	 * 按ID删除文章
	 * @param id
	 * @return
	 */
	@Delete("delete from articles where id=#{id}")  
	int delete(int id);
	
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
