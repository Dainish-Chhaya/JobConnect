package com.project.dao;

import com.project.model.JobApplicationVO;
import com.project.model.JobPostingVO;

import java.util.List;

public interface JobDAO {

    void saveJobPosting(JobPostingVO jobPostingVO);

    List<JobPostingVO> getJobPostingsByRecruiterId(Long recruiterId);

    JobPostingVO findById(int id);

    List<JobPostingVO> findAllActiveJobs();

    void saveJobApplication(JobApplicationVO jobApplicationVO);

    List<JobApplicationVO> getJobApplicationListByCandidateId(Long candidateId);

    List<JobApplicationVO> getJobApplicationsByRecruiterId(Long recruiterId);

    JobApplicationVO getJobApplicationById(Long applicationId);
}
