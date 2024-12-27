package com.project.dao;

import com.project.model.UserVO;

public interface UserDAO {
    UserVO save(UserVO userVO);

    UserVO findByUsername(String username);
}
