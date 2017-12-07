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
import com.yihengtang.yihengtang.service.UserService;
import com.yihengtang.yihengtang.util.IpUtil;
import com.yihengtang.yihengtang.util.PayUtil;
import com.yihengtang.yihengtang.util.WxPayConfig;
import com.yihengtang.yihengtang.wxpayimpl.MyConfig;

@RestController
@RequestMapping({ "/pay" })
public class PayController {

	@Autowired
	private UserService serService;

	@RequestMapping(value = "/openid", method = RequestMethod.GET)
	public String openid(String session) {
		return serService.openid(session);
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public Map<String, Object> ordre(HttpServletRequest request) {

		String openid = request.getParameter("openid");

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
		data.put("total_fee", "1");
		data.put("spbill_create_ip", IpUtil.getIpAddr(request).toString());
		data.put("notify_url", "https://liangyi120.xin/pay/wxNotify");
		data.put("trade_type", "JSAPI"); // 此处指定为小程序
		// data.put("product_id", "12");

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
			response.put("timeStamp", timeStamp+"");// 这边要将返回的时间戳转化成字符串，不然小程序端调用wx.requestPayment方法会报签名错误
			// 拼接签名需要的参数
			String stringSignTemp = "appId=" + config.getAppID() + "&nonceStr=" + nonce_str + "&package=prepay_id="
					+ prepay_id + "&signType=MD5&timeStamp=" + timeStamp;
			// 再次签名，这个签名用于小程序端调用wx.requesetPayment方法
			String paySign = PayUtil.sign(stringSignTemp, config.getKey(), "utf-8").toUpperCase();
			response.put("paySign", paySign);
		}
		return response;

	}

//	@RequestMapping(value = "/wxNotify")
//	public void wxNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		
//		BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream()));
//		String line = null;
//		StringBuilder sb = new StringBuilder();
//		while ((line = br.readLine()) != null) {
//			sb.append(line);
//		}
//		
//		System.out.println("接收到的报文：" + sb);
//		
//		 String notifyData = sb.toString(); // 支付结果通知的xml格式数据
//
//	        MyConfig config = new MyConfig();
//	        WXPay wxpay = new WXPay(config);
//
//	        Map<String, String> notifyMap = WXPayUtil.xmlToMap(notifyData);  // 转换成map
//
//	        if (wxpay.isPayResultNotifySignatureValid(notifyMap)) {
//	            // 签名正确
//	            // 进行处理。
//	            // 注意特殊情况：订单已经退款，但收到了支付结果成功的通知，不应把商户侧订单状态从退款改成支付成功
//	        }
//	        else {
//	            // 签名错误，如果数据里没有sign字段，也认为是签名错误
//	        }
//	    }
//	}
	
	
	/**
	 * @Description:微信支付
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/wxNotify")
	public void wxNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("收到通知"+request.getInputStream());
		BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream()));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		// sb为微信返回的xml
		String notityXml = sb.toString();
		String resXml = "";
		System.out.println("接收到的报文：" + notityXml);

		Map map = PayUtil.doXMLParse(notityXml);

		String returnCode = (String) map.get("return_code");
		if ("SUCCESS".equals(returnCode)) {
			// 验证签名是否正确
			if (PayUtil.verify(PayUtil.createLinkString(map), (String) map.get("sign"), WxPayConfig.key, "utf-8")) {
				/** 此处添加自己的业务逻辑代码start **/

				/** 此处添加自己的业务逻辑代码end **/
				// 通知微信服务器已经支付成功
				resXml = "<xml>" + "<return_code><![CDATA[SUCCESS]]></return_code>"
						+ "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";
			}
		} else {
			resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
					+ "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
		}
		System.out.println(resXml);
		System.out.println("微信支付回调数据结束");

		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		out.write(resXml.getBytes());
		out.flush();
		out.close();
	}
}
