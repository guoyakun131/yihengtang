package com.yihengtang.yihengtang.service;



import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yihengtang.yihengtang.dao.DepartmentMapper;
import com.yihengtang.yihengtang.entity.DepartmentAndNumber;
import com.yihengtang.yihengtang.entity.Experts;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper depatmentMapper;
	@Autowired
	/**
	 * 查询部门名称
	 * @return
	 */
	public List<Object> depatment(){
		return depatmentMapper.departmentList();
	}
	
	/**
	 * 各部门人数
	 * @return
	 */
	public List<Object> departmentNumber() {
		return depatmentMapper.departmentNumber();
	}
	
	/**
	 * 部门名称和部门人数
	 * @return
	 */
	public List<DepartmentAndNumber> departmentAndNumber(){
	List<DepartmentAndNumber> dent = depatmentMapper.departmentAndNumber();
	return dent;
	}
	
	
     public Map<List<DepartmentAndNumber>,List<Experts>>dep(){
    	 Map<List<DepartmentAndNumber>,List<Experts>> map = new HashMap<>();
    	 List<DepartmentAndNumber> departmentName = depatmentMapper.departmentName();
    	 
    	 for (DepartmentAndNumber departmentAndNumber : departmentName) {
			map.put(departmentAndNumber, value);
		}
		return null;
     }
}
