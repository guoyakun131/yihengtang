package com.yihengtang.yihengtang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.yihengtang.yihengtang.entity.Reservation;
import com.yihengtang.yihengtang.service.ExpertsService;
import com.yihengtang.yihengtang.service.UserService;
import com.yihengtang.yihengtang.util.SendSms;

@RestController
@RequestMapping({ "/user" })
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private ExpertsService expertService;
	
	String verificationCode = null;

	/**
	 * 返回通知消息和
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/atten")
	public String attentionAndNotification(String session) {
		return userService.attentionAndNotification(userService.openid(session));
	}

	@RequestMapping("/me")
	public Map<String, Object> about(String session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String openid = userService.openid(session);
		map.put("about", userService.reservationNumber(openid));

		if (userService.phoneNumber(openid).length() != 0) {
			map.put("binding", "已绑定");
		} else {
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

	
	/**
	 * 发送验证码
	 * 
	 * @param phoneNumber
	 * @return
	 */
	@RequestMapping("/VerificationCode")
	public String VerificationCode(String openid, String phoneNumber) {
		// 查看是否绑定过手机号
		if (userService.phoneNumber(openid).length() != 0) {
			return "手机号已经绑定";
		}

		// 生成四位随机数作为验证码
		verificationCode = userService.VerificationCode();
		// 发送验证码短信到用户手机
		SendSmsResponse response;
		try {
			response = SendSms.sendSms(phoneNumber, verificationCode);
			System.out.println("短信接口返回的数据----------------");
			System.out.println("Code=" + response.getCode());
			System.out.println("Message=" + response.getMessage());
			System.out.println("RequestId=" + response.getRequestId());
			System.out.println("BizId=" + response.getBizId());
		} catch (ClientException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return "验证码发送异常";

		}
		return "验证已发送";

	}
	
	@RequestMapping("/binding")
	public String binDing(String openid, String phoneNumber,String code) {
		// 查看是否绑定过手机号
	    if (userService.phoneNumber(openid).length() != 0) {
		    return "手机号已经绑定";
		}
	    
	    if(code == verificationCode) {
	    	//绑定手机
	    	userService.binDing(phoneNumber);
	    	return "绑定成功";
	    }
	    return "绑定失败,请重试";
	}

}
