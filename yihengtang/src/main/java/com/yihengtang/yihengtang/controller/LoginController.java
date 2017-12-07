package com.yihengtang.yihengtang.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.yihengtang.yihengtang.dao.UserMapper;
import com.yihengtang.yihengtang.util.OpenHttps;

@RestController
@RequestMapping({ "/login" })
public class LoginController {

	@Autowired
	private UserMapper userMapper;

	@RequestMapping("/login")
	public String login(String code) {

		if (code != null && !"".equals(code)) {
			String url = "https://api.weixin.qq.com/sns/jscode2session";
			String appId = "wx0d0edc31204549b9";
			String appSecret = "8a67fdf3f2fde35392183e3691177e33";
			String httpUrl = url + "?appid=" + appId + "&secret=" + appSecret + "&js_code=" + code
					+ "&grant_type=authorization_code";

			// 发送请求到微信服务器换去openid 和session_key
			String resuslt = OpenHttps.httpRequest(httpUrl, "GET", null);
			System.out.println(resuslt);
			JsonObject obj = new JsonParser().parse(resuslt).getAsJsonObject();

			if (!obj.has("errcode")) {
				String openid = obj.get("openid").getAsString();
				String session_key = obj.get("session_key").getAsString();
				String openidAndSessionKey_value = openid + session_key;
				String rsession_key = UUID.randomUUID().toString();

				if (userMapper.selectOpenid(openid) == 1) {
					userMapper.updata(openid, rsession_key, openidAndSessionKey_value);
				} else {
					userMapper.add(openid, rsession_key, openidAndSessionKey_value);
				}
				JsonObject object = new JsonObject();
				object.addProperty("session_key", rsession_key);
				return object.toString();

			} else {
				return resuslt;
			}
		}

		return "code为空";
	}
}