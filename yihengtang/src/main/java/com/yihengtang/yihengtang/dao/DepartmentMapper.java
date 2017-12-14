package com.yihengtang.yihengtang.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.yihengtang.yihengtang.entity.DepartmentAndNumber;



@Mapper
public interface DepartmentMapper {

	/**
	 *  查询部门名称
	 * @return
	 */
	@Select("SELECT d.department,COUNT(e.department_id) FROM experts e,department d WHERE e.department_id = d.experts_id GROUP BY d.department")
	List<Object> departmentList();
	
	/**
	 *  查询每个部门的医生数量
	 * @return
	 */
	@Select("SELECT COUNT(e.department_id) as number FROM experts e,department d WHERE e.department_id = d.experts_id GROUP BY d.department")
	List<Object> departmentNumber();
	
	
	/**
	 *  查询部门名称和人数
	 * @return
	 */
	@Select("SELECT d.department, COUNT(e.department_id) as number FROM experts e,department d WHERE e.department_id = d.experts_id GROUP BY d.department")
	List<DepartmentAndNumber> departmentAndNumber();
	
	/**
	 * 查询出所有部门名称
	 * @return
	 */
	@Select("SELECT department FROM department")
	List<DepartmentAndNumber> departmentName();
}


