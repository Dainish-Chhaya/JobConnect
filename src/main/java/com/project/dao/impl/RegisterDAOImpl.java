package com.project.dao.impl;

import com.project.dao.RecruiterDAO;
import com.project.model.RecruiterVO;
import com.project.model.UserVO;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class RegisterDAOImpl implements RecruiterDAO {

    private final SessionFactory sessionFactory;

    @Override
    public void save(RecruiterVO recruiterVO) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(recruiterVO);
    }

    @Override
    public RecruiterVO findRecruiterByUserVO(UserVO userVO) {
        Session session = sessionFactory.getCurrentSession();
        return (RecruiterVO) session.createQuery("from RecruiterVO where userVO = :userVO")
                .setParameter("userVO", userVO)
                .uniqueResult();
    }

    @Override
    public List<RecruiterVO> getAllRecruiters() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from RecruiterVO where userVO.isDelete = false");
        List recruiters = query.list();
        return recruiters;
    }
}
