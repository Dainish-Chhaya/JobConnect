package com.project.service.impl;

import com.project.dao.UserDAO;
import com.project.model.UserVO;
import com.project.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final UserDAO userDAO;

    @Override
    @Transactional
    public void save(UserVO userVO) {
        this.userDAO.save(userVO);
    }

}
