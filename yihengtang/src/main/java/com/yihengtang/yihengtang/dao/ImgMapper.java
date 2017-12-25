package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yihengtang.yihengtang.entity.Img;

public interface ImgMapper {

	/**
	 * 查询轮播图
	 * @return
	 */
	@Select("select * from img")
	List<Img> img();
	
	/**
	 * 图片上下架
	 * @param state
	 * @param id
	 * @return
	 */
	@Update("UPDATE img SET state = #{state} where id = #{id}")
	int imgState(@Param("state")int state, @Param("id")int id);
	
	@Insert("insert into img (imgUrl,state) values (#{imgUrl},0)")
	void addUrl(String imgUrl);
	
	@Delete("delete from img where id = #{id}")
	int imgDelete(int id);
}
