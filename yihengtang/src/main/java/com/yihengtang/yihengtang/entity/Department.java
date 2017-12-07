package com.yihengtang.yihengtang.entity;

public class Department {
	
  private int id;
  /**
   * 科室名
   */
  private String department;
  /**
   * 关联的医生Id
   */
  private Experts experts_id;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getDepartment() {
	return department;
}

public void setDepartment(String department) {
	this.department = department;
}


public Experts getExperts_id() {
	return experts_id;
}

public void setExperts_id(Experts experts_id) {
	this.experts_id = experts_id;
}
   

}
