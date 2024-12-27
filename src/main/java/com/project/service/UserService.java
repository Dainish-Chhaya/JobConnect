package com.project.service;

import com.project.model.CandidateVO;
import com.project.model.RecruiterVO;
import com.project.model.UserVO;

import java.util.List;

public interface UserService {
    UserVO getUserByUsername(String username);

    RecruiterVO getRecruiterByUserVO(UserVO userVO);

    RecruiterVO getRecruiterByUsername(String username);

    void saveRecruiter(RecruiterVO recruiterVO);

    CandidateVO getCandidateByUserVO(UserVO userVO);

    CandidateVO getCandidateByUsername(String username);

    void saveCandidate(CandidateVO candidateVO);

    List<RecruiterVO> getAllRecruiters();

    List<CandidateVO> getAllCandidates();
}
