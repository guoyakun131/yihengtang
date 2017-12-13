package com.yihengtang.yihengtang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	private String verificationCode = null;

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
	public String cancel(String session, int e_id) {
		
		userService.cancel(e_id,userService.userId(userService.openid(session)));
		return "取消已申请";
	}

	
	/**
	 * 发送验证码
	 * @param phoneNumber
	 * @return
	 */
	@RequestMapping("/VerificationCode")
	public String VerificationCode(String session, String phoneNumber) {
		if(session == null && phoneNumber == null) {
		   return "请输入正确的手机号";
		}
		// 查看是否绑定过手机号
		if (userService.phoneNumber(userService.openid(session)).length() != 0) {
			return "手机号已经绑定";
		}

		// 生成四位随机数作为验证码
		verificationCode = userService.VerificationCode();
		//添加验证码到数据库
		userService.addCode(verificationCode, userService.openid(session));
		
		System.out.println(verificationCode);
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
	
	/**
	 * 绑定手机
	 * @param session
	 * @param phoneNumber
	 * @param code
	 * @return
	 */
	@RequestMapping("/binding")
	public String binDing(String session, String phoneNumber,String code) {
		System.out.println(userService.openid(session));
		System.out.println(phoneNumber);
		System.out.println(code);
		// 查看是否绑定过手机号
	    if (userService.phoneNumber(userService.openid(session)).equals(phoneNumber)) {
		    return "手机号已经绑定";
		}
	    
	    if(userService.cheakCode(userService.openid(session)).equals(code)) {
	    	//绑定手机
	    	userService.binDing(phoneNumber,userService.openid(session));
	    	return "绑定成功";
	    }
	    return "绑定失败,请重试";
	}

	@RequestMapping("/message")
	public List<String> message(String session) {
		return  userService.message(userService.userId(userService.openid(session)));
	}
}
