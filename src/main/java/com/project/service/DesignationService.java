package com.project.service;

import com.project.model.DesignationVO;

import java.util.List;

public interface DesignationService {

	void save(DesignationVO designationVO);

	List<DesignationVO> search();

	List<DesignationVO> findByID(int id);

    boolean designationExists(String designationName);
}
