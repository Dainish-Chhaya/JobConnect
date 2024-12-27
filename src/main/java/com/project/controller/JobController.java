package com.project.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import com.project.model.*;
import com.project.service.DepartmentService;
import com.project.service.DesignationService;
import com.project.service.JobService;
import com.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

/**
 * Controller for managing job postings, job applications, and offer letters.
 * Handles actions related to creating, viewing, editing, and deleting job postings,
 * viewing applicants, updating job application status, and generating offer letters.
 */
@Controller
@RequiredArgsConstructor
public class JobController {

    private final JobService jobService;           // Service for job-related operations
    private final DesignationService designationService;   // Service for managing job designations
    private final DepartmentService departmentService;     // Service for managing departments
    private final UserService userService;         // Service for managing user-related operations
    @Value("${file.upload-dir}")
    private String uploadDirectory;

    /**
     * Displays the job posting creation form with a list of available designations and departments.
     *
     * @return a ModelAndView object with the job posting form and lists of designations and departments.
     */
    @GetMapping(value = "recruiter/addJobPosting")
    public ModelAndView addJobPosting() {
        // Fetch the list of designations and departments for the recruiter to choose from
        List<DesignationVO> designationList = this.designationService.search();
        List<DepartmentVO> departmentList = this.departmentService.search();

        // Return the job posting creation view with the necessary data
        return new ModelAndView("recruiter/addJobPosting", "jobPostingVO", new JobPostingVO())
                .addObject("designationList", designationList).addObject("departmentList", departmentList);
    }

    /**
     * Saves a new job posting to the database.
     *
     * @param jobPostingVO the job posting data submitted by the recruiter.
     * @param principal    the authenticated recruiter who is submitting the job posting.
     * @return a redirect to the add job posting page after saving the job posting.
     */
    @PostMapping(value = "recruiter/saveJobPosting")
    public ModelAndView saveJobPosting(@ModelAttribute JobPostingVO jobPostingVO, Principal principal) {

        // Get the recruiter details from the authenticated user
        RecruiterVO recruiterVO = userService.getRecruiterByUsername(principal.getName());

        // Associate the recruiter with the job posting
        jobPostingVO.setRecruiterVO(recruiterVO);

        // Save the job posting to the database
        this.jobService.saveJobPosting(jobPostingVO);

        // Redirect to the add job posting page
        return new ModelAndView("redirect:/recruiter/addJobPosting");
    }

    /**
     * Displays a list of all job postings created by recruiters.
     *
     * @return a ModelAndView object containing a list of job postings.
     */
    @GetMapping(value = "recruiter/viewJobPostings")
    public ModelAndView viewJobPostings(Principal principal) {

        // Get the recruiter details from the authenticated user
        RecruiterVO recruiterVO = userService.getRecruiterByUsername(principal.getName());

        // Fetch the list of all job postings
        List<JobPostingVO> jobPostingList = this.jobService.search(recruiterVO.getId());
        System.out.println("jobPostingList = " + jobPostingList);

        // Return the view displaying all job postings
        return new ModelAndView("recruiter/viewJobPostings", "jobPostingList", jobPostingList);
    }

    /**
     * Pre-fills the job posting form with data for editing an existing job posting.
     *
     * @param jobPostingVO the job posting object to be edited.
     * @param id           the ID of the job posting to be edited.
     * @return a ModelAndView object with the job posting data pre-filled and available designations and departments.
     */
    @GetMapping(value = "recruiter/editJobPostings")
    public ModelAndView editJobPostings(@ModelAttribute JobPostingVO jobPostingVO, @RequestParam int id) {
        // Fetch the job posting to be edited
        JobPostingVO jobPostingVOResponse = this.jobService.findById(id);

        // Fetch the list of designations and departments
        List<DesignationVO> designationList = this.designationService.search();
        List<DepartmentVO> departmentList = this.departmentService.search();

        // Return the job posting edit form pre-filled with job posting details and available options
        return new ModelAndView("recruiter/addJobPosting", "jobPosting", jobPostingVOResponse)
                .addObject("designationList", designationList).addObject("departmentList", departmentList);
    }

    /**
     * Marks a job posting as inactive and deleted.
     *
     * @param id the ID of the job posting to be deleted.
     * @return a redirect to the view job postings page after deleting the job posting.
     */
    @GetMapping(value = "recruiter/deleteJobPostings")
    public ModelAndView deleteJobPostings(@RequestParam int id) {
        // Fetch the job posting to be deleted
        JobPostingVO jobPostingVOResponse = this.jobService.findById(id);

        // Mark the job posting as inactive and deleted
        jobPostingVOResponse.setActive(Boolean.FALSE);
        jobPostingVOResponse.setDelete(Boolean.TRUE);

        // Update the job posting in the database
        this.jobService.saveJobPosting(jobPostingVOResponse);

        // Redirect to the view job postings page
        return new ModelAndView("redirect:/recruiter/viewJobPostings");
    }

    /**
     * Updates the status of a job posting (active or inactive).
     *
     * @param jobId  the ID of the job posting to update.
     * @param status the new status of the job posting (active or inactive).
     * @return a ModelAndView object displaying the updated list of job postings.
     */
    @PostMapping(value = "recruiter/updateJobStatus")
    public ModelAndView updateJobStatus(@RequestParam int jobId, @RequestParam boolean status) {
        // Fetch the job posting by ID
        JobPostingVO jobPostingVO = jobService.findById(jobId);

        // Update the job posting status
        if (jobPostingVO != null) {
            jobPostingVO.setActive(status);
            jobService.saveJobPosting(jobPostingVO);
        }

        // Fetch the updated list of job postings
        List<JobPostingVO> jobPostingVOList = this.jobService.search(jobPostingVO.getRecruiterVO().getId());

        // Return the updated list of job postings
        return new ModelAndView("recruiter/viewJobPostings", "jobPostingList", jobPostingVOList);
    }

    /**
     * Displays a list of applicants who have applied for the recruiter's job postings.
     *
     * @param principal the authenticated recruiter.
     * @return a ModelAndView object with a list of job applications for the recruiter.
     */
    @GetMapping(value = "recruiter/viewApplicants")
    public ModelAndView addJobPosting(Principal principal) {
        // Fetch the recruiter details from the authenticated user
        RecruiterVO recruiterVO = userService.getRecruiterByUsername(principal.getName());

        // Fetch the list of job applications made to this recruiter
        List<JobApplicationVO> jobApplications = this.jobService.getJobApplicationsByRecruiterId(recruiterVO.getId());

        // Return the view with the job applications list
        return new ModelAndView("recruiter/viewApplicants", "jobApplications", jobApplications);
    }

    /**
     * Handles file downloads (resume files).
     *
     * @param fileName the name of the file to be downloaded.
     * @return a ResponseEntity object containing the file as a resource for download.
     * @throws IOException if there is an error while reading the file.
     */
    @RequestMapping("/downloadResume/{fileName:.+}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName) throws IOException {

        // Resolve the file path relative to the upload directory
        Path filePath = Paths.get(uploadDirectory).resolve(fileName).normalize();

        // Check if the file exists
        Resource resource = new FileSystemResource(filePath);
        if (resource.exists()) {
            // Get the content type of the file
            String contentType = Files.probeContentType(filePath);
            if (contentType == null) {
                contentType = "application/octet-stream";
            }

            // Return the file as an attachment for download
            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(contentType))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                    .body(resource);
        } else {
            // If the file doesn't exist, throw an exception
            throw new FileNotFoundException("File not found: " + fileName);
        }
    }

    /**
     * Updates the status of a job application (e.g., accepted, rejected, etc.).
     *
     * @param applicationId the ID of the application to update.
     * @param status        the new status of the job application.
     * @param principal     the authenticated recruiter.
     * @return a redirect to the view applicants page with the updated list of job applications.
     */
    @RequestMapping("/updateApplicationStatus/{applicationId}/{status}")
    public ModelAndView updateApplicationStatus(@PathVariable("applicationId") Long applicationId, @PathVariable("status") String status,
                                                Principal principal) {
        // Change the status of the job application
        this.jobService.changeApplicationStatus(applicationId, status);

        // Fetch the updated list of job applications for the recruiter
        RecruiterVO recruiterVO = userService.getRecruiterByUsername(principal.getName());
        List<JobApplicationVO> jobApplicationVOS = this.jobService.getJobApplicationsByRecruiterId(recruiterVO.getId());

        // Redirect to the view applicants page with the updated list
        return new ModelAndView("redirect:/recruiter/viewApplicants", "jobApplications", jobApplicationVOS);
    }

    /**
     * Generates and downloads an offer letter as a PDF for a selected job application.
     *
     * @param applicationId the ID of the job application.
     * @param response      the HTTP response to write the PDF content.
     * @throws DocumentException if there is an error while creating the PDF document.
     * @throws IOException       if there is an error while writing the PDF to the response.
     */
    @GetMapping("/generateOfferLetter/{applicationId}")
    public void generateOfferLetter(@PathVariable("applicationId") Long applicationId, HttpServletResponse response) throws DocumentException, IOException {
        // Get the job application by application ID
        JobApplicationVO jobApplicationVO = this.jobService.getJobApplicationById(applicationId);
        CandidateVO candidate = jobApplicationVO.getCandidateVO();

        // Create a new document for the offer letter
        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        // Initialize the PDF writer
        PdfWriter.getInstance(document, baos);

        // Open the document to add content
        document.open();

        // Add various sections to the offer letter (Title, Job and Compensation Details, etc.)
        document.add(new Paragraph("Offer Letter", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, Font.BOLD)));
        document.add(new Paragraph("\nDear " + candidate.getFirstName() + " " + candidate.getLastName() + ","));
        document.add(new Paragraph("We are pleased to offer you the position of " + jobApplicationVO.getJobPostingVO().getJobTitle() + " at our company."));

        // Add job title, department, compensation, start date, terms, etc.
        document.add(new Paragraph("\nJob Title: " + jobApplicationVO.getJobPostingVO().getJobTitle()));
        document.add(new Paragraph("Department: " + jobApplicationVO.getJobPostingVO().getDepartmentVO().getDepartmentName()));
        document.add(new Paragraph("Reporting to: " + jobApplicationVO.getJobPostingVO().getRecruiterVO().getFirstName() + " " + jobApplicationVO.getJobPostingVO().getRecruiterVO().getLastName()));

        document.add(new Paragraph("\nCompensation Details:"));
        document.add(new Paragraph("Base Salary: " + jobApplicationVO.getJobPostingVO().getSalary() + " per annum"));

        document.add(new Paragraph("\nYour expected start date will be " + jobApplicationVO.getAvailableStartDate() + "."));
        document.add(new Paragraph("Your primary work location will be: " + jobApplicationVO.getJobPostingVO().getLocation() + "."));

        // Add Terms and Conditions, Confidentiality Notice, and Acceptance section
        document.add(new Paragraph("\nTerms and Conditions:"));
        document.add(new Paragraph("1. You will be on probation for the first 6 months of employment."));
        document.add(new Paragraph("2. Your standard working hours will be from 9 AM to 6 PM, Monday to Friday."));
        document.add(new Paragraph("3. You will be eligible for medical insurance coverage and paid vacation days after 3 months of employment."));
        document.add(new Paragraph("4. You are required to sign a non-disclosure agreement (NDA) and a confidentiality agreement upon joining."));

        document.add(new Paragraph("\nPlease treat the terms of this offer as confidential."));

        document.add(new Paragraph("\nAcceptance:"));
        document.add(new Paragraph("To accept this offer, please sign and return this letter by [Date]."));

        document.add(new Paragraph("\nSincerely,"));
        document.add(new Paragraph(jobApplicationVO.getJobPostingVO().getRecruiterVO().getCompanyName()));
        document.add(new Paragraph(jobApplicationVO.getJobPostingVO().getRecruiterVO().getAddress()));
        document.add(new Paragraph(jobApplicationVO.getJobPostingVO().getRecruiterVO().getCompanyContact()));

        // Add signature placeholder
        document.add(new Paragraph("\n\n-------------------------"));
        document.add(new Paragraph("Signature of Candidate: _________________________"));
        document.add(new Paragraph("Date: _________________________"));

        // Close the document
        document.close();

        // Set the response content type to PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=offer_letter_" + candidate.getFirstName() + "_" + candidate.getLastName() + ".pdf");

        // Write the generated PDF to the response output stream
        baos.writeTo(response.getOutputStream());
        response.getOutputStream().flush();
    }
}
