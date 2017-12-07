package com.yihengtang.yihengtang.controller.domain;

import java.util.Map;

/** Controller返回给前端界面的类,可以直接使用 */
public class Result {
	private boolean success; /* 操作成功标志 */
	private String msg; /* 操作结果提示信息 */
	private int statusCode; /* 操作结果状态码 */
	private Map<String, Object> data; /* 操作结果数据 */

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

}