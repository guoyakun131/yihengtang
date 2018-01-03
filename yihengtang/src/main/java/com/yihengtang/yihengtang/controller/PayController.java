package com.yihengtang.yihengtang.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayUtil;
import com.yihengtang.yihengtang.entity.Experts;
import com.yihengtang.yihengtang.service.UserService;
import com.yihengtang.yihengtang.util.IpUtil;
import com.yihengtang.yihengtang.util.PayUtil;
import com.yihengtang.yihengtang.wxpayimpl.MyConfig;

@RestController
@RequestMapping({ "/pay" })
public class PayController {

	@Autowired
	private UserService userService;

	private String openid;

	private int e_id;
	@Autowired
	private Experts experts;

	@RequestMapping(value = "/openid", method = RequestMethod.GET)
	public String openid(String session) {
		return userService.openid(session);
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public Map<String, Object> ordre(HttpServletRequest request) throws Exception {
		openid = request.getParameter("openid");
		
		
		// 预约的医生id
		e_id = Integer.valueOf(request.getParameter("id")).intValue();
		experts = userService.expertsID(e_id);
		
		String amount = experts.getAmount();
		String amounts = null;
		if(userService.record(openid)) {
			int str = Integer.valueOf(amount).intValue()/2;
			amounts = String.valueOf(str);
		}else {
			amounts = amount;
		}
		
		MyConfig config = new MyConfig();
		WXPay wxpay = new WXPay(config);

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

		Map<String, String> data = new HashMap<String, String>();
		data.put("openid", openid);
		data.put("body", "预约挂号费");
		data.put("out_trade_no", sdf.format(d).toString());
		data.put("device_info", "");
		data.put("fee_type", "CNY");
		data.put("total_fee", amounts);
		data.put("spbill_create_ip", IpUtil.getIpAddr(request).toString());
		data.put("notify_url", "https://qubing.net.cn/pay/wxNotify");
		data.put("trade_type", "JSAPI"); // 此处指定为小程序
		// data.put("product_id", "12");
		System.out.println(data);
		Map<String, String> resp = null;
		try {
			resp = wxpay.unifiedOrder(data);
			System.out.println(resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String return_code = (String) resp.get("return_code");// 返回状态码
		System.out.println(return_code);
		Map<String, Object> response = new HashMap<String, Object>();// 返回给小程序端需要的参数
		if (return_code == "SUCCESS" || return_code.equals(return_code)) {
			String prepay_id = (String) resp.get("prepay_id");// 返回的预付单信息
			String nonce_str = (String) resp.get("nonce_str");
			response.put("nonceStr", nonce_str);
			response.put("package", "prepay_id=" + prepay_id);
			Long timeStamp = System.currentTimeMillis() / 1000;
			response.put("timeStamp", timeStamp + "");// 这边要将返回的时间戳转化成字符串，不然小程序端调用wx.requestPayment方法会报签名错误
			// 拼接签名需要的参数
			String stringSignTemp = "appId=" + config.getAppID() + "&nonceStr=" + nonce_str + "&package=prepay_id="
					+ prepay_id + "&signType=MD5&timeStamp=" + timeStamp;
			System.out.println("stringSignTemp"+stringSignTemp);
			// 再次签名，这个签名用于小程序端调用wx.requesetPayment方法
			System.out.println("执行");
			String paySign = PayUtil.sign(stringSignTemp, config.getKey(), "UTF-8").toString();
			//String paySign = WXPayUtil.generateSignature(resp,config.getKey());//再签名一次
			response.put("paySign", paySign);
			System.out.println("response:"+response);

		}
		return response;

	}

	@RequestMapping(value = "/wxNotify", method = RequestMethod.POST)
	public void wxNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//这句话的意思，是让浏览器用utf8来解析返回的数据  
      //  response.setHeader("Content-type", "text/html;charset=UTF-8");  
		BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream()));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		// sb为微信返回的xml
		String notifyData = sb.toString(); // 支付结果通知的xml格式数据
		String resXml = "";

		System.out.println("接收到的报文：" + notifyData);

		MyConfig config = new MyConfig();
		WXPay wxpay = new WXPay(config);

		Map<String, String> notifyMap = WXPayUtil.xmlToMap(notifyData); // 转换成map
		
		if (wxpay.isPayResultNotifySignatureValid(notifyMap)) {
			// 签名正确
			// 进行处理。
			// 注意特殊情况：订单已经退款，但收到了支付结果成功的通知，不应把商户侧订单状态从退款改成支付成功
			// 通知微信服务器已经支付成功
			resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
					+ "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
			// 预约成功
			userService.reservation(openid, experts.getId());
			
		} else {
			// 签名错误，如果数据里没有sign字段，也认为是签名错误
			resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
					+ "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
		}
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		out.write(resXml.getBytes());
		out.flush();
		out.close();
	}
}
