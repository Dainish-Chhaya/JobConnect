package com.project.service;

import com.project.model.JobApplicationVO;
import com.project.model.JobPostingVO;

import java.util.List;

public interface JobService {

    void saveJobPosting(JobPostingVO jobPostingVO);

    List<JobPostingVO> search(Long recruiterId);

    JobPostingVO findById(int id);

    List<JobApplicationVO> getJobApplicationListByCandidateId(Long candidateId);

    List<JobApplicationVO> getJobApplicationsByRecruiterId(Long recruiterId);

    void changeApplicationStatus(Long applicationId, String status);

    JobApplicationVO getJobApplicationById(Long applicationId);
}
