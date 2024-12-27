package com.project.dao.impl;

import com.project.dao.DepartmentDAO;
import com.project.model.DepartmentVO;
import lombok.RequiredArgsConstructor;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class DepartmentDAOImpl implements DepartmentDAO {

    private final SessionFactory sessionfactory;

    @Override
    public void save(DepartmentVO departmentVO) {
        sessionfactory.getCurrentSession().saveOrUpdate(departmentVO);
    }

    @Override
    public List search() {
        return sessionfactory
                .getCurrentSession()
                .createQuery("from DepartmentVO where isActive = true")
                .list();
    }

    @Override
    public List findById(int id) {
        return sessionfactory
                .getCurrentSession()
                .createQuery("from DepartmentVO where isActive = true and id = :id")
                .setParameter("id", id)
                .list();
    }

    @Override
    public DepartmentVO findByName(String departmentName) {
        return (DepartmentVO) sessionfactory
                .getCurrentSession()
                .createQuery("from DepartmentVO where isActive = true and departmentName = :departmentName")
                .setParameter("departmentName", departmentName)
                .uniqueResult();
    }

}
