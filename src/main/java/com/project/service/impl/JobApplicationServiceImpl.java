package com.project.service.impl;

import com.project.dao.JobDAO;
import com.project.model.JobApplicationVO;
import com.project.model.JobPostingVO;
import com.project.service.JobApplicationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class JobApplicationServiceImpl implements JobApplicationService {

    private final JobDAO jobDAO;


    @Override
    public List<JobPostingVO> findAllJobApplications() {
        return this.jobDAO.findAllActiveJobs();
    }

    @Override
    public void saveJobApplication(JobApplicationVO jobApplicationVO) {
        this.jobDAO.saveJobApplication(jobApplicationVO);
    }
}
