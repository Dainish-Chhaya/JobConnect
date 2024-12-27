package com.project.dao.impl;

import com.project.dao.DesignationDAO;
import com.project.model.DesignationVO;
import lombok.RequiredArgsConstructor;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class DesignationDAOImpl implements DesignationDAO {

    private final SessionFactory sessionfactory;

    @Override
    public void save(DesignationVO designationVO) {
        sessionfactory.getCurrentSession().saveOrUpdate(designationVO);
    }

    @Override
    public List search() {
        return sessionfactory
                .getCurrentSession()
                .createQuery("from DesignationVO where isActive = true")
                .list();
    }

    @Override
    public List findByID(int id) {
        return sessionfactory
                .getCurrentSession()
                .createQuery("from DesignationVO where isActive = true and id = :id")
                .setParameter("id", id)
                .list();
    }

    @Override
    public DesignationVO findByDesignationName(String designationName) {
        return (DesignationVO) sessionfactory
                .getCurrentSession()
                .createQuery("from DesignationVO where isActive = true and designationName = :designationName")
                .setParameter("designationName", designationName)
                .uniqueResult();
    }
}
