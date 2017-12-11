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

	// @Select("select id from user where openid = #{openid}")
	// int user_id(String openid);

	/**
	 * 按用户ID查询通知消息
	 * 
	 * @param u_id
	 * @return
	 */
	@Select("SELECT message from user u, notification n WHERE u.id = n.u_id and u.id = #{u_id}")
	List<String> notification(int u_id);

	/**
	 * 添加通知消息
	 * 
	 * @param message
	 * @param u_id
	 */
	@Select("insert into notification (message,u_id) values(#{message},#{u_id})")
	void addNotification(String message, int u_id);

	@Select("SELECT COUNT(*) FROM reservation r, user u WHERE u.reservation_id = r.u_id and u.openid = #{openid}")
	int reservationNumber(String openid);

	/**
	 * 正在预约查询
	 * 
	 * @param openid
	 * @return
	 */
	@Select("SELECT e.id,e.name, e.position, e.amount, e.img, e.numberOfPatients from experts e,user u,reservation r WHERE u.id = r.u_id and r.e_id = e.id and r.state = 0 and u.openid = #{openid}")
	List<Reservation> myReservation(String openid);

	/**
	 * 预约完成查询
	 * 
	 * @param openid
	 * @return
	 */
	@Select("SELECT e.name, e.position, e.amount, e.location, e.img, r.treatmenttTime from experts e,user u,reservation r WHERE u.id = r.u_id and r.e_id = e.id and r.state = 1 and u.openid = #{openid}")
	List<Reservation> myReservationAchieve(String openid);

	/**
	 * 通过openid查询用户id
	 * 
	 * @param openid
	 * @return
	 */
	@Select("SELECT id FROM user WHERE openid = #{openid}")
	int userId(String openid);

	/**
	 * 查询用户表中有没没有手机号
	 * 
	 * @param openid
	 * @return
	 */
	@Select("SELECT phoneNumber FROM user WHERE openid = #{openid}")
	String phoneNumber(String openid);

	/**
	 * 绑定手机号
	 * @param state
	 * @return
	 */
	@Insert("insert into user (phoneNumber) values(#{phoneNumber})")
	void bindingPhone(String phoneNumber);

	// 付款成功后添加预约
	@Insert("insert into reservation (e_id,u_id,state) values(#{e_id},#{u_id},#{state})")
	int addReservation(@Param("e_id") int e_id, @Param("u_id") int u_id, @Param("state") int state);

	/**
	 * 取消预约
	 * @param openid
	 */
	@Update("update reservation set state= 3 where e_id = #{e_id} and u_id = #{u_id}")
	void cancel(@Param("e_id")int e_id,@Param("u_id")int u_id);
	
	/**
	 *预约记录
	 * @param u_id
	 * @return
	 */
	@Select("SELECT COUNT(*) from reservation  WHERE state = 1 and u_id = #{u_id}")
	int record(int u_id);
}
