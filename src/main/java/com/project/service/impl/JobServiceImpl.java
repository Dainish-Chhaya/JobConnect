package com.project.service.impl;

import com.project.dao.JobDAO;
import com.project.model.JobApplicationVO;
import com.project.model.JobPostingVO;
import com.project.service.JobService;
import com.project.utils.BaseMethods;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;


@Service
@Transactional
@RequiredArgsConstructor
public class JobServiceImpl implements JobService {

    private final JobDAO jobDAO;

    @Override
    public void saveJobPosting(JobPostingVO jobPostingVO) {
        this.jobDAO.saveJobPosting(jobPostingVO);
    }

    @Override
    public List<JobPostingVO> search(Long recruiterId) {
        return this.jobDAO.getJobPostingsByRecruiterId(recruiterId);
    }

    @Override
    public JobPostingVO findById(int id) {
        System.out.println("id = " + id);
        return this.jobDAO.findById(id);
    }

    @Override
    public List<JobApplicationVO> getJobApplicationListByCandidateId(Long candidateId) {
        return this.jobDAO.getJobApplicationListByCandidateId(candidateId);
    }

    @Override
    public List<JobApplicationVO> getJobApplicationsByRecruiterId(Long recruiterId) {
        return this.jobDAO.getJobApplicationsByRecruiterId(recruiterId);
    }

    @Override
    public void changeApplicationStatus(Long applicationId, String status) {
        try {
            // get Job application by application id
            JobApplicationVO jobApplicationVO = this.jobDAO.getJobApplicationById(applicationId);
            if (status.equals("Accepted")) {
                System.out.println("inside accepted");
                jobApplicationVO.setStatus("Accepted");
                this.jobDAO.saveJobApplication(jobApplicationVO);
            } else if (status.equals("Rejected")) {
                System.out.println("inside rejected");
                jobApplicationVO.setStatus("Rejected");
                this.jobDAO.saveJobApplication(jobApplicationVO);
            } else if (status.equals("Interview")) {
                jobApplicationVO.setStatus("Interview");
                // send mail to the user
                BaseMethods.sendMail(jobApplicationVO.getCandidateVO().getEmail(), jobApplicationVO.getCandidateVO().getFirstName(), jobApplicationVO);
                jobApplicationVO.setInterviewLink("https://workspace.google.com/products/meet/");
                this.jobDAO.saveJobApplication(jobApplicationVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }


    }

    @Override
    public JobApplicationVO getJobApplicationById(Long applicationId) {
        return this.jobDAO.getJobApplicationById(applicationId);
    }
}
