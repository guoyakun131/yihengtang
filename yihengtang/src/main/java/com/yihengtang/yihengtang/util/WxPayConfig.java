package com.yihengtang.yihengtang.util;

/**
 * 小程序微信支付的配置文件
 * @author 
 *
 */
public class WxPayConfig {
	//小程序appid
	//public static final String appid = "wx0d0edc31204549b9";
	//小程序appid
	public static final String appid = "wxaffdf037ed96e75d";
	//微信支付的商户id
	public static final String mch_id = "1429475902";
	//微信支付的商户密钥
	public static final String key = "handanliangyikejiyouxiangongsi66";
	//支付成功后的服务器回调url
	public static final String notify_url = "https://liangyi120.xin/pay/wxNotify";
	//签名方式，固定值
	public static final String SIGNTYPE = "MD5";
	//交易类型，小程序支付的固定值为JSAPI
	public static final String TRADETYPE = "JSAPI";
	//微信统一下单接口地址
	public static final String pay_url = "https://api.mch.weixin.qq.com/pay/unifiedorder";
}
