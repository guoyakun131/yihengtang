package com.yihengtang.yihengtang.entity;

import java.util.Date;

public class User {
	private int id;
	private String nick_Name;
	private String avatar;
	private String add_Time;
	private String openid;
	private String session_key;
	private String expires_in;
	private String notification;
	private String reservation;
	
	public int getId() {
		return id;
	}
	
	
	public String getNick_Name() {
		return nick_Name;
	}

	public void setNick_Name(String nick_Name) {
		this.nick_Name = nick_Name;
	}


	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	public String getAdd_Time() {
		return add_Time;
	}

	public void setAdd_Time(String add_Time) {
		this.add_Time = add_Time;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getSession_key() {
		return session_key;
	}
	public void setSession_key(String session_key) {
		this.session_key = session_key;
	}
	public String getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(String expires_in) {
		this.expires_in = expires_in;
	}
	public String getNotification() {
		return notification;
	}
	public void setNotification(String notification) {
		this.notification = notification;
	}
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}


}
