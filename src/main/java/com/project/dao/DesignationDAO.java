package com.project.dao;

import com.project.model.DesignationVO;

import java.util.List;

public interface DesignationDAO {

	void save(DesignationVO designationVO);

	List<DesignationVO> search();

	List<DesignationVO> findByID(int id);

    DesignationVO findByDesignationName(String designationName);
}
