package com.yihengtang.yihengtang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.yihengtang.yihengtang.entity.Reservation;
import com.yihengtang.yihengtang.service.UserService;

@RestController
@RequestMapping({ "/user" })
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/atten")
	public String attentionAndNotification(String session) {
		return userService.attentionAndNotification(userService.openid(session));
	}

	@RequestMapping("/about")
	public int about(String session) {
		return userService.reservationNumber(userService.openid(session));
	}
	
	@RequestMapping("/myReservation")
	public List<Reservation> myReservation(String session) {
		return userService.myReservation(userService.openid(session));
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
	
	
}
