package com.project.service;

import com.project.model.RegisterVO;

public interface RegisterService {
    void registerUser(RegisterVO registerVO);

    boolean usernameExists(String username);
}
