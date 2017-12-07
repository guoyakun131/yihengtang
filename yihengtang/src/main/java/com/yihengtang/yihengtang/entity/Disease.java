package com.yihengtang.yihengtang.entity;

/**
 * 疾病实体类
 * @author Administrator
 *
 */
public class Disease {

	private int id;
	/**
	 * 疾病名称
	 */
	private String diseaseName;
	/**
	 * 关联医生id
	 */
	private Experts experts_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public Experts getExperts_id() {
		return experts_id;
	}
	public void setExperts_id(Experts experts_id) {
		this.experts_id = experts_id;
	}
	
	
}
