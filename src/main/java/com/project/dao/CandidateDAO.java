package com.project.dao;

import com.project.model.CandidateVO;
import com.project.model.UserVO;

import java.util.List;

public interface CandidateDAO {
    void save(CandidateVO candidateVO);

    CandidateVO findCandidateByUserVO(UserVO userVO);

    CandidateVO findCandidateByUsername(String username);

    List<CandidateVO> getAllCandidates();
}
