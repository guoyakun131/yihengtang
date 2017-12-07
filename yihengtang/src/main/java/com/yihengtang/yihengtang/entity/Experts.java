package com.yihengtang.yihengtang.entity;

/**
 * 专家类
 * @author 郭亚坤
 * @version 1.0.0
 */
public class Experts {
	
	/**
	 * Id主键自动递增
	 */
	private int id;
	/**
	 * 专家姓名
	 */
	private String  name;
	/**
	 * 专家性别
	 */
	private String  gender;
	
	/**
	 * 职位例如：主治医师、教授
	 */
	private String  position;
	/**
	 * 简介
	 */
	private String  profile;
	/**
	 * 详细简介
	 */
	private String  profiles;
	/**
	 * 看诊时间
	 */
	private String  kanzhenshijian;
	/**
	 * 就诊地点
	 */
	private String  location;
	/**
	 * 就诊详细地点
	 */
	private String  locations;
	/**
	 * 就诊金额
	 */
	private String  amount;
	/**
	 * 专家图片地址
	 */
	private String img;
	/**
	 * 疾病id
	 */
	private Disease diseae_id; 
	
	/**
	 * 科室id
	 */
	private int  department_id;
	
	/**
	 * 诊断舒数量
	 */
	private int quantity;

	/**
	 * 用户id
	 */
	private int u_id;
	
	public Experts() {
		super();
	}

	public Experts(int id, String name, String gender, String position, String profile, String profiles,
			String kanzhenshijian, String location, String locations, String amount, String img, Disease diseae_id,
			int department_id, int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.position = position;
		this.profile = profile;
		this.profiles = profiles;
		this.kanzhenshijian = kanzhenshijian;
		this.location = location;
		this.locations = locations;
		this.amount = amount;
		this.img = img;
		this.diseae_id = diseae_id;
		this.department_id = department_id;
		this.quantity = quantity;
	}

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getProfiles() {
		return profiles;
	}

	public void setProfiles(String profiles) {
		this.profiles = profiles;
	}

	public String getKanzhenshijian() {
		return kanzhenshijian;
	}

	public void setKanzhenshijian(String kanzhenshijian) {
		this.kanzhenshijian = kanzhenshijian;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocations() {
		return locations;
	}

	public void setLocations(String locations) {
		this.locations = locations;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Disease getDiseae_id() {
		return diseae_id;
	}

	public void setDiseae_id(Disease diseae_id) {
		this.diseae_id = diseae_id;
	}

	public int getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	
}
