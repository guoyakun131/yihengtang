package com.yihengtang.yihengtang.entity;

public class Reservation {
	private int id;
	private String name;
	private String position;
	private String amount;
	private String location;
	private String img;
	private String treatmenttTime;
	private int numberOfPatients;

	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTreatmenttTime() {
		return treatmenttTime;
	}

	public void setTreatmenttTime(String treatmenttTime) {
		this.treatmenttTime = treatmenttTime;
	}

	public int getNumberOfPatients() {
		return numberOfPatients;
	}

	public void setNumberOfPatients(int numberOfPatients) {
		this.numberOfPatients = numberOfPatients;
	}

	
	
}
