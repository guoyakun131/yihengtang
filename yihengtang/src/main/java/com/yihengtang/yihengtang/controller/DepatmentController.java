package com.yihengtang.yihengtang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yihengtang.yihengtang.entity.DepartmentAndNumber;
import com.yihengtang.yihengtang.service.DepartmentService;

@RestController
@RequestMapping({"/depatment"})
public class DepatmentController {

	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 查询部门信息
	 * @return
	 */
	@RequestMapping("/list")
    public List<DepartmentAndNumber> depatmentList(){
		return departmentService.departmentAndNumber();
	}
/**按部门查询专家数量
 * 
 * @return
 */
	@RequestMapping("/number")
    public List<Object> departmentNumber(){
		return departmentService.departmentNumber();
	}
	
}
