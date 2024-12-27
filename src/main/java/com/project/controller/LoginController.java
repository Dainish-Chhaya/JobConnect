package com.project.controller;

import com.project.model.CandidateVO;
import com.project.model.RecruiterVO;
import com.project.model.UserVO;
import com.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.List;

/**
 * Controller responsible for handling user login, profile checks, and logout functionality.
 * It directs users to the correct page based on their roles (Admin, Recruiter, Candidate) and profile completeness.
 */
@Controller
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;  // User service for interacting with user-related data

    /**
     * Method to load the login page for the user to enter credentials.
     *
     * @return ModelAndView object to display the login page.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView loadLogin() {
        return new ModelAndView("login", "userVO", new UserVO()); // Return login page with a new UserVO object
    }

    /**
     * Method for the admin to view the dashboard with counts of recruiters and candidates.
     *
     * @return ModelAndView object with counts of recruiters and candidates to display on the admin index page.
     */
    @RequestMapping(value = "/admin/index", method = RequestMethod.GET)
    public ModelAndView adminIndex() {
        // Fetch the list of recruiters and candidates from the service layer
        List<RecruiterVO> recruiters = this.userService.getAllRecruiters();
        List<CandidateVO> candidates = this.userService.getAllCandidates();

        // Return the admin dashboard view with recruiters and candidates count
        return new ModelAndView("admin/index")
                .addObject("recruitersCount", recruiters.size())
                .addObject("candidatesCount", candidates.size());
    }

    /**
     * Method for recruiters to check if their profile is complete.
     * If the profile is complete, redirect to the recruiter dashboard. Otherwise, redirect to the profile completion page.
     *
     * @param principal the logged-in recruiter.
     * @return ModelAndView object for redirecting to either recruiter dashboard or profile completion page.
     */
    @RequestMapping(value = "/recruiter/checkProfile", method = RequestMethod.GET)
    public ModelAndView recruiterProfile(Principal principal) {
        String userName = principal.getName(); // Get the logged-in username
        System.out.println("userName = " + userName);

        // Fetch the UserVO object using the username
        RecruiterVO recruiterVO = this.userService.getRecruiterByUsername(userName);

        // Check if the recruiter's profile is complete and redirect accordingly
        if (recruiterVO.isProfileComplete()) {
            return new ModelAndView("redirect:/recruiter/index"); // Redirect to recruiter dashboard if profile is complete
        } else {
            return new ModelAndView("redirect:/recruiter/profile", "recruiter", new RecruiterVO()); // Redirect to profile completion page
        }
    }

    /**
     * Method for the recruiter to view their dashboard page.
     *
     * @return ModelAndView object to display the recruiter dashboard.
     */
    @RequestMapping(value = "/recruiter/index", method = RequestMethod.GET)
    public ModelAndView recruiterIndex() {
        return new ModelAndView("recruiter/index"); // Return the recruiter dashboard page
    }

    /**
     * Method for candidates to check if their profile is complete.
     * If the profile is complete, redirect to the candidate dashboard. Otherwise, redirect to the profile completion page.
     *
     * @param principal the logged-in candidate.
     * @return ModelAndView object for redirecting to either candidate dashboard or profile completion page.
     */
    @RequestMapping(value = "/candidate/checkProfile", method = RequestMethod.GET)
    public ModelAndView candidateProfile(Principal principal) {
        String userName = principal.getName(); // Get the logged-in username
        System.out.println("userName = " + userName);

        // Fetch the UserVO object using the username
        CandidateVO candidateVO = this.userService.getCandidateByUsername(userName);

        // Check if the candidate's profile is complete and redirect accordingly
        if (candidateVO.isProfileComplete()) {
            return new ModelAndView("redirect:/candidate/index"); // Redirect to candidate dashboard if profile is complete
        } else {
            return new ModelAndView("redirect:/candidate/profile", "candidate", new CandidateVO()); // Redirect to profile completion page
        }
    }

    /**
     * Method for the candidate to view their dashboard page.
     *
     * @return ModelAndView object to display the candidate dashboard.
     */
    @RequestMapping(value = "/candidate/index", method = RequestMethod.GET)
    public ModelAndView userIndex() {
        return new ModelAndView("candidate/index"); // Return the candidate dashboard page
    }

    /**
     * Method to handle user logout.
     * Invalidates the session and logs out the current user from the system.
     *
     * @param model    ModelMap for storing session attributes.
     * @param response HttpServletResponse to handle response.
     * @param request  HttpServletRequest to access session data.
     * @return a redirect to the login page after successful logout.
     */
    @RequestMapping(value = "/logout", method = {RequestMethod.POST, RequestMethod.GET})
    public String viewUserDetails(ModelMap model, HttpServletResponse response, HttpServletRequest request) {
        // Get the authentication object for the current session
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            // Log out the user and invalidate the session
            new SecurityContextLogoutHandler().logout(request, response, auth);
            request.getSession().invalidate();
            // Set logout success message in the session
            request.getSession().setAttribute("tempStatus", "success");
            request.getSession().setAttribute("statusText", "Logout Successfully!");
        }
        return "login"; // Redirect to the login page
    }

    /**
     * Method to load the login page.
     *
     * @return ModelAndView object to display the login page.
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView load() {
        return new ModelAndView("login"); // Return the login page
    }

    /**
     * Method to load the 403 error page when the user is unauthorized to access a particular resource.
     *
     * @return ModelAndView object to display the 403 error page.
     */
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView load403() {
        return new ModelAndView("login"); // Return the 403 error page
    }

    /**
     * Method to handle general errors, e.g., page not found or other errors.
     *
     * @return ModelAndView object to display the error page.
     */
    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public ModelAndView error() {
        return new ModelAndView("login"); // Return the error page (login page in this case)
    }
}
