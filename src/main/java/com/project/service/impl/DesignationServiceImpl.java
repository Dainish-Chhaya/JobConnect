package com.project.service.impl;

import com.project.dao.DesignationDAO;
import com.project.model.DesignationVO;
import com.project.service.DesignationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class DesignationServiceImpl implements DesignationService {

    private final DesignationDAO designationDAO;

    @Override
    public void save(DesignationVO designationVO) {
        this.designationDAO.save(designationVO);
    }

    @Override
    public List<DesignationVO> search() {
        return this.designationDAO.search();
    }

    @Override
    public List<DesignationVO> findByID(int id) {
        return this.designationDAO.findByID(id);
    }

    @Override
    public boolean designationExists(String designationName) {
        DesignationVO designationVO = this.designationDAO.findByDesignationName(designationName);
        if (designationVO != null) {
            return true;
        }
        return false;
    }

}
