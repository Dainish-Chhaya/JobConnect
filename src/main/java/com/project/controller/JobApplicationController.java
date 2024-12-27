package com.project.controller;

import com.project.model.CandidateVO;
import com.project.model.JobApplicationVO;
import com.project.model.JobPostingVO;
import com.project.service.JobApplicationService;
import com.project.service.JobService;
import com.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

/**
 * Controller class for managing job applications for candidates.
 * Handles actions like viewing job listings, applying for jobs, submitting applications, and viewing candidate's applications.
 */
@Controller
@RequiredArgsConstructor
public class JobApplicationController {

    private final JobApplicationService jobApplicationService;
    private final JobService jobService;
    private final UserService userService;

    @Value("${file.upload-dir}")
    private String uploadDirectory;

    /**
     * Displays the job listings for the candidate, including the list of jobs and any previous applications.
     *
     * @param principal the authenticated user (candidate).
     * @return a ModelAndView containing the job listings and the candidate's previous applications.
     */
    @GetMapping(value = "candidate/jobListing")
    public ModelAndView addEmployee(Principal principal) {
        // Fetch the list of all job postings available
        List<JobPostingVO> jobPostings = this.jobApplicationService.findAllJobApplications();

        // Get the candidate details by the authenticated username
        CandidateVO candidateVO = this.userService.getCandidateByUsername(principal.getName());

        // Fetch the list of job applications made by this candidate
        List<JobApplicationVO> jobApplications = this.jobService.getJobApplicationListByCandidateId(candidateVO.getId());
        System.out.println("jobApplications = " + jobApplications);

        // Return the view with job postings and job applications for the candidate
        return new ModelAndView("candidate/jobListing", "jobPostings", jobPostings)
                .addObject("jobApplications", jobApplications);
    }

    /**
     * Displays the job application form for a candidate to apply for a specific job.
     *
     * @param jobId     the ID of the job the candidate wants to apply for.
     * @param principal the authenticated user (candidate).
     * @return a ModelAndView containing the job application form.
     */
    @GetMapping(value = "candidate/applyForJob")
    public ModelAndView applyForJob(@RequestParam("id") Long jobId, Principal principal) {
        // Fetch the job posting by its ID
        JobPostingVO jobPostingVO = this.jobService.findById(jobId.intValue());
        System.out.println("jobPosting.toString() = " + jobPostingVO.toString());

        // Get the candidate details by the authenticated username
        CandidateVO candidateVO = this.userService.getCandidateByUsername(principal.getName());
        System.out.println("candidateVO.toString() = " + candidateVO.toString());

        // Create a new JobApplicationVO object and set its job posting and candidate details
        JobApplicationVO jobApplicationVO = new JobApplicationVO();
        jobApplicationVO.setJobPostingVO(jobPostingVO);
        jobApplicationVO.setCandidateVO(candidateVO);

        // Return the view with the job application form
        return new ModelAndView("candidate/applyForJob", "jobApplicationVO", jobApplicationVO);
    }

    /**
     * Submits the job application by the candidate, including uploading the resume.
     *
     * @param jobApplicationVO the job application object containing the job and candidate details.
     * @param resumeFile       the resume file uploaded by the candidate.
     * @return a redirect to the job listings page.
     */
    @PostMapping(value = "candidate/saveJobApplication")
    public ModelAndView submitApplication(@ModelAttribute JobApplicationVO jobApplicationVO,
                                          @RequestParam("resumeFile") MultipartFile resumeFile
            , BindingResult result, HttpServletRequest request) {
        String errorMessage = "";
        // Check if the resume file is not empty
        if (resumeFile.isEmpty()) {
            errorMessage = "Resume file is required.";
            result.rejectValue("resumeFile", "error.jobApplicationVO", errorMessage);
        }

        // check the file extension
        String fName = resumeFile.getOriginalFilename();
        String fileExtension = fName != null ? fName.substring(fName.lastIndexOf('.') + 1).toLowerCase() : "";
        System.out.println("fileExtension = " + fileExtension);
        if (!result.hasErrors() && !(fileExtension.equals("pdf") || fileExtension.equals("docx"))) {
            System.out.println("inside");
            errorMessage = "Invalid file format. Please upload a PDF or DOCX file.";
            result.rejectValue("resumeFilePath", "error.jobApplicationVO", errorMessage);
        }

        // If there are any validation errors, return the user to the department form with error messages
        if (result.hasErrors()) {
            // Pass the BindingResult as a model attribute to the view
            return new ModelAndView("errorPage")
                    .addObject("errorMessage", errorMessage)
                    .addObject("lastVisitedPage", request.getHeader("Referer"));
        }


        // Ensure the upload directory exists; if not, create it
        File uploadDir = new File(uploadDirectory);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // Create directories if they don't exist
        }

        // Check if the resume file is not empty
        if (!resumeFile.isEmpty()) {
            try {
                // Generate a unique file name using the current timestamp
                String fileName = System.currentTimeMillis() + resumeFile.getOriginalFilename();
                System.out.println("fileName = " + fileName);

                // Create the destination file in the specified directory
                File destinationFile = new File(uploadDirectory + fileName); // e.g., /uploads/resume.pdf

                // Save the uploaded resume file to the server
                resumeFile.transferTo(destinationFile);

                // Set the file path and application date in the JobApplication object
                String resumeFilePath = uploadDirectory + fileName;
                jobApplicationVO.setResumeFilePath(fileName);
                jobApplicationVO.setApplicationDate(LocalDate.now().toString());
                jobApplicationVO.setStatus("Applied");

                // Save the job application to the database
                this.jobApplicationService.saveJobApplication(jobApplicationVO);
            } catch (IOException e) {
                e.printStackTrace();  // Print the error if the file upload fails
            }
        }

        // Retrieve the list of job postings and redirect the user to the job listings page
        List<JobPostingVO> jobPostings = this.jobApplicationService.findAllJobApplications();
        return new ModelAndView("redirect:/candidate/jobListing", "jobPostings", jobPostings);
    }

    /**
     * Displays the list of job applications submitted by the candidate.
     *
     * @param principal the authenticated user (candidate).
     * @return a ModelAndView containing the list of job applications made by the candidate.
     */
    @GetMapping(value = "candidate/myApplications")
    public ModelAndView myApplications(Principal principal) {
        // Get the candidate details by the authenticated username
        CandidateVO candidateVO = this.userService.getCandidateByUsername(principal.getName());

        // Fetch the list of job applications submitted by the candidate
        List<JobApplicationVO> jobApplications = this.jobService.getJobApplicationListByCandidateId(candidateVO.getId());
        System.out.println("jobApplications.size() = " + jobApplications.size());

        // Return the view with the list of job applications
        return new ModelAndView("candidate/myApplications", "jobApplications", jobApplications);
    }
}
