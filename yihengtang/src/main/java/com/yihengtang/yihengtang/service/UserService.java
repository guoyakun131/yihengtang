package com.yihengtang.yihengtang.service;

import java.util.List;

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
		userMppaer.addReservation(e_id,userMppaer.userId(openid),0);
	}
	
}
