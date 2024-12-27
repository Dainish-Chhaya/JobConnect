package com.project.service;

import com.project.model.JobApplicationVO;
import com.project.model.JobPostingVO;

import java.util.List;

public interface JobApplicationService {
    List<JobPostingVO> findAllJobApplications();

    void saveJobApplication(JobApplicationVO jobApplicationVO);
}
