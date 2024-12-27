package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Data
@Table(name = "job_posting_master")
@AllArgsConstructor
@NoArgsConstructor
public class JobPostingVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Job title cannot be empty")
    @Size(min = 2, max = 100, message = "Job title must be between 3 and 100 characters")
    @Column(name = "job_title")
    private String jobTitle;

    @NotEmpty(message = "Job description cannot be empty")
    @Size(min = 5, max = 500, message = "Job description must be between 10 and 500 characters")
    @Column(name = "job_description")
    private String description;

    @NotEmpty(message = "Employment type cannot be empty")
    @Column(name = "employment_type")
    private String employmentType;

    @NotEmpty(message = "Job location cannot be empty")
    @Size(min = 3, max = 100, message = "Job location must be between 3 and 100 characters")
    @Column(name = "job_location")
    private String jobLocation;

    @NotEmpty(message = "Salary cannot be empty")
    @Column(name = "salary")
    private String salary;

    @NotEmpty(message = "Required experience cannot be empty")
    @Pattern(regexp = "\\d+(\\+)?", message = "Required experience must be a valid number (e.g., 3, 5+, etc.)")
    @Column(name = "req_experience")
    private String requiredExperience;

    @NotEmpty(message = "Location cannot be empty")
    @Size(min = 3, max = 100, message = "Location must be between 3 and 100 characters")
    @Column(name = "location")
    private String location;

    @ManyToOne
    @JoinColumn(name = "department_id")
    private DepartmentVO departmentVO;

    @ManyToOne
    @JoinColumn(name = "designation_id")
    private DesignationVO designationVO;

    @ManyToOne
    @JoinColumn(name = "recruiter_id", nullable = false)
    private RecruiterVO recruiterVO;

    @Column(name = "is_active")
    private boolean isActive = true;

    @Column(name = "is_delete")
    private boolean isDelete = false;
}
