package com.project.dao.impl;

import com.project.dao.UserDAO;
import com.project.model.UserVO;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO {

    private final SessionFactory sessionFactory;

    @Override
    public UserVO save(UserVO userVO) {
        Session session = sessionFactory.openSession();
        session.saveOrUpdate(userVO);
        return userVO;
    }

    @Override
    public UserVO findByUsername(String username) {
        return (UserVO) sessionFactory
                .getCurrentSession()
                .createQuery("from UserVO where username = :username")
                .setParameter("username", username)
                .uniqueResult();
    }

}
