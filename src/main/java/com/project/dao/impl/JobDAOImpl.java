package com.project.dao.impl;

import com.project.dao.JobDAO;
import com.project.model.JobApplicationVO;
import com.project.model.JobPostingVO;
import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class JobDAOImpl implements JobDAO {

    private final SessionFactory sessionFactory;

    @Override
    public void saveJobPosting(JobPostingVO jobPostingVO) {
        sessionFactory.getCurrentSession().saveOrUpdate(jobPostingVO);
    }

    @Override
    public List getJobPostingsByRecruiterId(Long recruiterId) {
        return sessionFactory.getCurrentSession().createQuery("from JobPostingVO where recruiterVO.id = :recruiterId")
                .setParameter("recruiterId", recruiterId)
                .list();
    }

    @Override
    public JobPostingVO findById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from JobPostingVO where id = '" + id + " '");
        return (JobPostingVO) query.uniqueResult();

    }

    @Override
    public List findAllActiveJobs() {
        return sessionFactory
                .getCurrentSession()
                .createQuery("from JobPostingVO where isDelete = false and isActive = true")
                .list();
    }

    @Override
    public void saveJobApplication(JobApplicationVO jobApplicationVO) {
        sessionFactory.getCurrentSession().saveOrUpdate(jobApplicationVO);
    }

    @Override
    public List getJobApplicationListByCandidateId(Long candidateId) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("from JobApplicationVO where candidateVO.id = :candidateId")
                .setParameter("candidateId", candidateId)
                .list();
    }

    @Override
    public List getJobApplicationsByRecruiterId(Long recruiterId) {
        return sessionFactory
                .getCurrentSession()
                .createQuery("from JobApplicationVO where jobPostingVO.recruiterVO.id = :recruiterId")
                .setParameter("recruiterId", recruiterId)
                .list();
    }

    @Override
    public JobApplicationVO getJobApplicationById(Long applicationId) {
        return (JobApplicationVO) sessionFactory.getCurrentSession().createQuery("from JobApplicationVO where id = :applicationId")
                .setParameter("applicationId", applicationId)
                .uniqueResult();
    }

}
