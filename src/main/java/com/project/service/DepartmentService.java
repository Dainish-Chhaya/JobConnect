package com.project.service;

import java.util.List;

import com.project.model.DepartmentVO;

public interface DepartmentService {

	void save(DepartmentVO departmentVO);

	List<DepartmentVO> search();

	List<DepartmentVO> findById(int id);

    boolean departmentExists(String departmentName);
}
