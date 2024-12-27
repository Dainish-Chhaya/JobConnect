package com.project.controller;

import com.project.model.CandidateVO;
import com.project.model.RecruiterVO;
import com.project.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * MainController handles the navigation and views for the Admin functionalities.
 * It includes routes for the Admin home page and viewing all users (recruiters and candidates).
 */
@Controller
@RequiredArgsConstructor
public class MainController {

    private final UserService userService; // Injecting the userService to fetch recruiters and candidates

    /**
     * Method to display the Admin home page.
     *
     * @return ModelAndView for rendering the Admin dashboard.
     */
    @GetMapping("admin/home")
    public ModelAndView index() {
        // Return the 'admin/index' view which serves as the Admin's homepage
        return new ModelAndView("admin/index");
    }

    /**
     * Method to display the list of all recruiters and candidates in the system.
     *
     * @return ModelAndView containing recruiters and candidates to be displayed in the 'admin/viewUsers' page.
     */
    @GetMapping("admin/viewUsers")
    public ModelAndView viewUsers() {
        // Fetch lists of all recruiters and candidates from the UserService
        List<RecruiterVO> recruiters = this.userService.getAllRecruiters();
        List<CandidateVO> candidates = this.userService.getAllCandidates();

        // Return the 'admin/viewUsers' page with recruiters and candidates data to be displayed
        return new ModelAndView("admin/viewUsers", "recruiters", recruiters)
                .addObject("candidates", candidates); // Add both recruiters and candidates as objects in the view
    }
}
