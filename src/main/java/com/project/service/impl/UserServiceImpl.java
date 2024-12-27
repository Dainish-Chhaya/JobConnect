package com.project.service.impl;

import com.project.dao.CandidateDAO;
import com.project.dao.RecruiterDAO;
import com.project.dao.UserDAO;
import com.project.model.CandidateVO;
import com.project.model.RecruiterVO;
import com.project.model.UserVO;
import com.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class UserServiceImpl implements UserService {

    private final UserDAO userDAO;
    private final RecruiterDAO recruiterDAO;
    private final CandidateDAO candidateDAO;

    @Override
    public UserVO getUserByUsername(String username) {
        return this.userDAO.findByUsername(username);
    }

    @Override
    public RecruiterVO getRecruiterByUserVO(UserVO userVO) {
        return this.recruiterDAO.findRecruiterByUserVO(userVO);
    }

    @Override
    public RecruiterVO getRecruiterByUsername(String username) {
        UserVO user = this.userDAO.findByUsername(username);
        return this.recruiterDAO.findRecruiterByUserVO(user);
    }

    @Override
    @Transactional
    public void saveRecruiter(RecruiterVO recruiterVO) {
        this.recruiterDAO.save(recruiterVO);
    }

    @Override
    public CandidateVO getCandidateByUserVO(UserVO userVO) {
        return this.candidateDAO.findCandidateByUserVO(userVO);
    }

    @Override
    public CandidateVO getCandidateByUsername(String username) {
        return this.candidateDAO.findCandidateByUsername(username);
    }

    @Override
    public void saveCandidate(CandidateVO candidateVO) {
        this.candidateDAO.save(candidateVO);
    }

    @Override
    public List<RecruiterVO> getAllRecruiters() {
        return this.recruiterDAO.getAllRecruiters();
    }

    @Override
    public List<CandidateVO> getAllCandidates() {
        return this.candidateDAO.getAllCandidates();
    }
}
