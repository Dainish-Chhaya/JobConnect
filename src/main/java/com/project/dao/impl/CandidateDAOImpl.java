package com.project.dao.impl;

import com.project.dao.CandidateDAO;
import com.project.model.CandidateVO;
import com.project.model.UserVO;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CandidateDAOImpl implements CandidateDAO {

    private final SessionFactory sessionFactory;

    @Override
    public void save(CandidateVO candidateVO) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(candidateVO);
    }

    @Override
    public CandidateVO findCandidateByUserVO(UserVO userVO) {
        Session session = sessionFactory.getCurrentSession();
        return (CandidateVO) session.createQuery("from CandidateVO where userVO = :userVO")
                .setParameter("userVO", userVO)
                .uniqueResult();
    }

    @Override
    public CandidateVO findCandidateByUsername(String username) {
        return (CandidateVO) sessionFactory.getCurrentSession().createQuery("from CandidateVO where userVO.username = :username")
                .setParameter("username", username)
                .uniqueResult();
    }

    @Override
    public List getAllCandidates() {
        return sessionFactory.
                getCurrentSession()
                .createQuery("from CandidateVO where userVO.isDelete = false")
                .list();

    }
}
