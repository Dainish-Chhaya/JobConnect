package com.project.service.impl;

import com.project.dao.CandidateDAO;
import com.project.dao.RecruiterDAO;
import com.project.dao.UserDAO;
import com.project.model.CandidateVO;
import com.project.model.RecruiterVO;
import com.project.model.RegisterVO;
import com.project.model.UserVO;
import com.project.service.RegisterService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class RegisterServiceImpl implements RegisterService {

    private final UserDAO userDAO;
    private final RecruiterDAO recruiterDAO;
    private final CandidateDAO candidateDAO;
    private final PasswordEncoder passwordEncoder;


    @Override
    public void registerUser(RegisterVO registerVO) {
        System.out.println("registerVO = " + registerVO.toString());

        UserVO user = new UserVO();
        user.setUsername(registerVO.getUsername());
        user.setPassword(registerVO.getPassword());
//        user.setPassword(passwordEncoder.encode(registerVO.getPassword()));
        user.setRole(registerVO.getRole());
        user.setActive(Boolean.TRUE);
        user.setDelete(Boolean.FALSE);

        UserVO savedUser = this.userDAO.save(user);
        System.out.println("user.toString() = " + savedUser.toString());
        if (registerVO.getRole().equals("ROLE_RECRUITER")) {
            // save Recruiter
            RecruiterVO recruiterVO = new RecruiterVO();
            recruiterVO.setFirstName(registerVO.getFirstName());
            recruiterVO.setLastName(registerVO.getLastName());
            recruiterVO.setEmail(registerVO.getUsername());
            recruiterVO.setProfileComplete(Boolean.FALSE);
            recruiterVO.setUserVO(savedUser);
            System.out.println("recruiterVO.toString() = " + recruiterVO.toString());
            recruiterDAO.save(recruiterVO);

        } else {
            // save Applicant
            CandidateVO candidateVO = new CandidateVO();
            candidateVO.setFirstName(registerVO.getFirstName());
            candidateVO.setLastName(registerVO.getLastName());
            candidateVO.setEmail(registerVO.getUsername());
            candidateVO.setProfileComplete(Boolean.FALSE);
            candidateVO.setUserVO(savedUser);
            System.out.println("candidateVO.toString() = " + candidateVO.toString());
            // save candidate
            this.candidateDAO.save(candidateVO);
        }

    }

    @Override
    public boolean usernameExists(String username) {
        UserVO user = this.userDAO.findByUsername(username);
        if (user != null) {
            return true;
        }
        return false;
    }
}
