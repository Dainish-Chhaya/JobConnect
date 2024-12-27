package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Data
@Table(name = "job_application_master")
@AllArgsConstructor
@NoArgsConstructor
public class JobApplicationVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "job_id", nullable = false)
    private JobPostingVO jobPostingVO;

    @ManyToOne
    @JoinColumn(name = "candidate_id", nullable = false)
    private CandidateVO candidateVO;

    @NotEmpty(message = "Resume file path cannot be empty")
    @Size(min = 5, max = 500, message = "Resume file path must be between 5 and 500 characters")
    @Column(name = "resume_file_path")
    private String resumeFilePath;

    @NotEmpty(message = "Available start date cannot be empty")
    @Pattern(regexp = "\\d{4}-\\d{2}-\\d{2}", message = "Available start date must be in the format yyyy-MM-dd")
    @Column(name = "available_start_date")
    private String availableStartDate;

    @Column(name = "linkedin_profile")
    private String linkedinProfile;

    @NotEmpty(message = "Preferred interview date cannot be empty")
    @Pattern(regexp = "\\d{4}-\\d{2}-\\d{2}", message = "Preferred interview date must be in the format yyyy-MM-dd")
    @Column(name = "preferred_interview_date")
    private String preferredInterviewDate;

    @NotEmpty(message = "Status cannot be empty")
    @Size(min = 3, max = 20, message = "Status must be between 3 and 20 characters")
    private String status; // e.g., Applied, Interview, Accepted, Rejected

    @Column(name = "interview_link")
    private String interviewLink;

    @NotEmpty(message = "Application date cannot be empty")
    @Pattern(regexp = "\\d{4}-\\d{2}-\\d{2}", message = "Application date must be in the format yyyy-MM-dd")
    @Column(name = "application_date")
    private String applicationDate;
}
