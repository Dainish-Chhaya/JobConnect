package com.project.dao;

import com.project.model.RecruiterVO;
import com.project.model.UserVO;

import java.util.List;

public interface RecruiterDAO {
    void save(RecruiterVO recruiterVO);

    RecruiterVO findRecruiterByUserVO(UserVO userVO);

    List<RecruiterVO> getAllRecruiters();
}
