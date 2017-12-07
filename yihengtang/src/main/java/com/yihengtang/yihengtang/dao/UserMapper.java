package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.google.gson.JsonObject;
import com.yihengtang.yihengtang.entity.Reservation;


@Mapper
public interface UserMapper {

	@Select("select COUNT(*) from user where openid = #{openid}")
	int selectOpenid(String openid);

	@Insert("insert into user (openid,session, openiAndsessionKey) values(#{openid},#{session}, #{openidAndSessionKey})")
	int add(@Param("openid") String openid, @Param("session") String session,
			@Param("openidAndSessionKey") String openidAndSessionKey);

	@Update("UPDATE user SET session = #{rsession_key}, openiAndsessionKey = #{openidAndSessionKey} WHERE openid = #{openid}")
	int updata(@Param("openid") String openid, @Param("rsession_key") String rsession_key,
			@Param("openidAndSessionKey") String openidAndSessionKey);
	
	@Select("select openid from user where session = #{session}")
	String Openid(String session);
	
	@Select("select COUNT(*) from experts e,user u where u.id = e.u_id and u.id = #{u_id}")
	int attention(int u_id);
	
//	@Select("select id from user where openid = #{openid}")
//	int user_id(String openid);
	
	@Select("SELECT message from user u, notification n WHERE u.id = n.u_id and u.id = #{u_id}")
	List<String> notification(int u_id);
	
	@Select("SELECT COUNT(*) FROM reservation r, user u WHERE u.reservation_id = r.u_id and u.openid = #{openid}")
	int reservationNumber(String openid);
	
	/**
	 * 正在预约查询
	 * @param openid
	 * @return
	 */
	@Select("SELECT e.name, e.position, e.amount, e.img from experts e,user u,reservation r WHERE u.id = r.u_id and r.e_id = e.id and r.state = 0 and u.openid = #{openid}")
	List<Reservation> myReservation(String openid);
	
	
	/**
	 * 预约完成查询
	 * @param openid
	 * @return
	 */
	@Select("SELECT e.name, e.position, e.amount, e.location, e.img, r.treatmenttTime from experts e,user u,reservation r WHERE u.id = r.u_id and r.e_id = e.id and r.state = 1 and u.openid = #{openid}")
	List<Reservation> myReservationAchieve(String openid);
	
	/**
	 * 通过openid查询用户id
	 * @param openid
	 * @return
	 */
	@Select("SELECT id FROM user WHERE openid = #{openid}")
	int userId(String openid);
	
	//付款成功后添加预约
	@Insert("insert into reservation (e_id,u_id,state) values(#{e_id},#{u_id},#{state})")
	int addReservation(int e_id, int u_id, int state);
}
