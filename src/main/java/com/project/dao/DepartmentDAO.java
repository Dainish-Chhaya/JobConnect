package com.project.dao;

import com.project.model.DepartmentVO;

import java.util.List;

public interface DepartmentDAO {

    void save(DepartmentVO departmentVO);

    List<DepartmentVO> search();

    List<DepartmentVO> findById(int id);

    DepartmentVO findByName(String departmentName);
}
