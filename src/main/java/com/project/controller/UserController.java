package com.project.controller;

import com.project.model.CandidateVO;
import com.project.model.RecruiterVO;
import com.project.model.UserVO;
import com.project.service.LoginService;
import com.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

/**
 * UserController manages the user's profile-related actions for both recruiters and candidates.
 * It handles viewing and saving user profiles and redirects users accordingly.
 */
@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;  // Inject UserService to manage user and profile operations
    private final LoginService loginService;  // Inject LoginService for handling login operations

    /**
     * Method to display the recruiter profile page.
     * It retrieves the logged-in user's details and passes the recruiter profile to the view.
     *
     * @param principal The logged-in user's principal (username) from the security context
     * @return ModelAndView for the recruiter profile page with the recruiter details
     */
    @GetMapping("/recruiter/profile")
    public ModelAndView showRecruiterProfilePage(Principal principal) {
        // Retrieve the logged-in user's username from the Principal object
        String username = principal.getName();
        System.out.println("username = " + username);

        // Fetch the user details from the database using the UserService
        UserVO user = this.userService.getUserByUsername(username);
        System.out.println("user.toString() = " + user.toString());

        // Fetch the recruiter details associated with the user
        RecruiterVO recruiter = userService.getRecruiterByUserVO(user);
        System.out.println("recruiter.toString() = " + recruiter.toString());

        // Pass the recruiter object to the view for rendering the profile page
        return new ModelAndView("recruiter/profile", "recruiter", recruiter);
    }

    /**
     * Method to save the recruiter profile after the form submission.
     * Updates the user's profile status and saves the recruiter details.
     *
     * @param recruiterVO The recruiter details from the form submission
     * @param principal   The logged-in user's principal (username) from the security context
     * @return Redirects to the recruiter index page after saving the profile
     */
    @PostMapping("/recruiter/saveProfile")
    public String saveRecruiterProfile(@ModelAttribute("recruiter") RecruiterVO recruiterVO, Principal principal) {
        // Retrieve the logged-in user's username from the Principal object
        String username = principal.getName();

        // Fetch the user details from the database using the UserService
        UserVO user = userService.getUserByUsername(username);

        // Associate the recruiterVO object with the user details
        recruiterVO.setUserVO(user);

        // Save or update the recruiter profile in the database
        recruiterVO.setProfileComplete(true);
        this.userService.saveRecruiter(recruiterVO);

        // Redirect to the recruiter index page after saving the profile
        return "redirect:/recruiter/index";
    }

    /**
     * Method to display the candidate profile page.
     * It retrieves the logged-in user's details and passes the candidate profile to the view.
     *
     * @param principal The logged-in user's principal (username) from the security context
     * @return ModelAndView for the candidate profile page with the candidate details
     */
    @GetMapping("/candidate/profile")
    public ModelAndView showCandidateProfilePage(Principal principal) {
        // Retrieve the logged-in user's username from the Principal object
        String username = principal.getName();
        System.out.println("username = " + username);

        // Fetch the user details from the database using the UserService
        UserVO user = this.userService.getUserByUsername(username);
        System.out.println("user.toString() = " + user.toString());

        // Fetch the candidate details associated with the user
        CandidateVO candidate = userService.getCandidateByUserVO(user);
        System.out.println("candidate.toString() = " + candidate.toString());

        // Pass the candidate object to the view for rendering the profile page
        return new ModelAndView("candidate/profile", "candidate", candidate);
    }

    /**
     * Method to save the candidate profile after the form submission.
     * Updates the user's profile status and saves the candidate details.
     *
     * @param candidateVO The candidate details from the form submission
     * @param principal   The logged-in user's principal (username) from the security context
     * @return Redirects to the candidate index page after saving the profile
     */
    @PostMapping("/candidate/saveProfile")
    public String saveCandidateProfile(@ModelAttribute("candidate") CandidateVO candidateVO, Principal principal) {
        // Retrieve the logged-in user's username from the Principal object
        String username = principal.getName();

        // Fetch the user details from the database using the UserService
        UserVO user = userService.getUserByUsername(username);

        // Associate the candidateVO object with the user details
        candidateVO.setUserVO(user);

        // Save or update the candidate profile in the database
        candidateVO.setProfileComplete(true);
        this.userService.saveCandidate(candidateVO);

        // Redirect to the candidate index page after saving the profile
        return "redirect:/candidate/index";
    }
}
