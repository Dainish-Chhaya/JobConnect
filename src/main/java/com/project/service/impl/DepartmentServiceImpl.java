package com.project.service.impl;

import com.project.dao.DepartmentDAO;
import com.project.model.DepartmentVO;
import com.project.service.DepartmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {


    private final DepartmentDAO departmentDAO;

    @Override
    public void save(DepartmentVO departmentVO) {
        this.departmentDAO.save(departmentVO);
    }

    @Override
    public List<DepartmentVO> search() {
        return this.departmentDAO.search();
    }

    @Override
    public List<DepartmentVO> findById(int id) {
        return this.departmentDAO.findById(id);
    }

    @Override
    public boolean departmentExists(String departmentName) {
        DepartmentVO departmentVO = this.departmentDAO.findByName(departmentName);
        if (departmentVO != null) {
            return true;
        }
        return false;
    }


}
