package com.yihengtang.yihengtang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yihengtang.yihengtang.entity.Reservation;
import com.yihengtang.yihengtang.service.ExpertsService;
import com.yihengtang.yihengtang.service.UserService;

@RestController
@RequestMapping({ "/user" })
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ExpertsService expertService;

	/**
	 * 返回通知消息和
	 * @param session
	 * @return
	 */
	@RequestMapping("/atten")
	public String attentionAndNotification(String session) {
		return userService.attentionAndNotification(userService.openid(session));
	}

	@RequestMapping("/me")
	public Map<String,Object> about(String session) {
		Map<String,Object> map = new HashMap<String, Object>();
		String openid = userService.openid(session);
		 map.put("about", userService.reservationNumber(openid));
		 
		 if(userService.phoneNumber(openid).length() != 0) {
			 map.put("binding", "已绑定");
		 }else {
			 map.put("binding", "未绑定");
		 }
		 return map;
	}
	
	@RequestMapping("/myReservation")
	public List<Reservation> myReservation(String session) {
		List<Reservation> myReservation = userService.myReservation(userService.openid(session));
		
		return myReservation;
	}
	
	@RequestMapping("/myReservationAchieve")
	public List<Reservation> myReservationAchieve(String session) {
		return userService.myReservationAchieve(userService.openid(session));
	}
	
	@RequestMapping("/cancel")
	public String cancel(String session) {
		userService.openid(session);
		
		return "取消成功s";
	}
	
	@RequestMapping("/binding")
	public String binDing(String phoneNumber) {
		
		return "取消成功s";
	}
	/**
	 * 发送验证码
	 * @param session
	 * @return
	 */
	@RequestMapping("/VerificationCode")
	public String VerificationCode(String session) {
		 String verificationCode = userService.VerificationCode();
		
	}
}
