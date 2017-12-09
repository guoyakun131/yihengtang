package com.yihengtang.yihengtang.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.yihengtang.yihengtang.dao.ExpertsMapper;
import com.yihengtang.yihengtang.dao.UserMapper;
import com.yihengtang.yihengtang.entity.Experts;
import com.yihengtang.yihengtang.entity.Reservation;

@Service
public class UserService {

	@Autowired
	private UserMapper userMppaer;
	
	@Autowired
	private ExpertsMapper expertsMapper;
	
	public String openid(String session) {
		return userMppaer.Openid(session);
	}

	
	
	public String attentionAndNotification(String openid) {
		int u_id = userMppaer.userId(openid);
		int attention = userMppaer.attention(u_id);
         //查询通知消息
		List<String> message = userMppaer.notification(u_id);
		JsonObject object = new JsonObject();
		Gson gson = new Gson();
		String jsonstring = gson.toJson(message);
		object.addProperty("attention", attention);
		object.addProperty("message", jsonstring);
		return object.toString();
	}

	public int reservationNumber(String openid) {
		return userMppaer.reservationNumber(openid);
	}

	public List<Reservation> myReservation(String openid) {
		List<Reservation> myReservation = userMppaer.myReservation(openid);
		
		
		//
//		JsonObject object = new JsonObject();
		//Gson gson = new Gson();
		//String jsonMyReservation = gson.toJson(myReservation);
		//String jsonMyReservationAchieve = gson.toJson(myReservationAchieve);
//		object.addProperty("myReservation", jsonMyReservation);
//		object.addProperty("myReservationAchieve", jsonMyReservationAchieve);
		return myReservation;
	}
	
	public List<Reservation> myReservationAchieve(String openid) {
		List<Reservation> myReservationAchieve = userMppaer.myReservationAchieve(openid);
		return myReservationAchieve;
	}
	/**
	 * 按Id查询医生信息
	 * @param e_id
	 * @return
	 */
	public Experts expertsID(int e_id) {
		return expertsMapper.findExpertsByID(e_id);
	}
	
    /**
     * 用户付款后预约，通过openid查出是哪个用户的预约和预约的医生id
     * @param openid
     * @return
     */
	public void reservation(String openid,int e_id) {
		int u_id = userMppaer.userId(openid);
		//添加预约
		userMppaer.addReservation(e_id,u_id,0);
		
		//加1
		expertsMapper.numberOfPatients(e_id);
		
		//添加通知
		userMppaer.addNotification("恭喜预约成功", u_id);
	}
	
	/**
	 * 查询用户时候绑定手机号
	 * @param openid
	 * @return
	 */
	public String phoneNumber(String openid) {
		return userMppaer.phoneNumber(openid);
	}
	/**
	 * 产生4位随机数(0000-9999)
	 * @param session
	 * @return
	 */
	public String VerificationCode() {
		 Random random = new Random();
	        String fourRandom = random.nextInt(10000) + "";
	        int randLength = fourRandom.length();
	        if(randLength<4){
	          for(int i=1; i<=4-randLength; i++)
	              fourRandom = "0" + fourRandom  ;
	      }
	        return fourRandom;
	}
	
//	/**
//	 * 按用户id添加通知
//	 * @param message
//	 * @param u_id
//	 */
//	public void addNotification(String message,int u_id) {
//		userMppaer.addNotification(message, u_id);
//	}
	
}
