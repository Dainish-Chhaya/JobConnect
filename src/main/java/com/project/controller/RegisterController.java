package com.project.controller;

import com.project.model.RegisterVO;
import com.project.service.RegisterService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * RegisterController handles the user registration process.
 * It includes methods for showing the registration form and processing the form submission.
 */
@Controller
@RequiredArgsConstructor
public class RegisterController {

    private final RegisterService registerService; // Injecting RegisterService to handle registration logic

    /**
     * Method to show the registration page where the user can enter registration details.
     *
     * @return ModelAndView to render the registration form.
     */
    @RequestMapping("/register")
    public ModelAndView showRegistrationPage() {
        // Return the 'register' view with an empty RegisterVO object to bind data from the form
        return new ModelAndView("register", "registerVO", new RegisterVO());
    }

    /**
     * Method to handle the registration form submission.
     * It receives the RegisterVO object with the user details, processes the registration,
     * and redirects the user to the login page upon successful registration.
     *
     * @param registerVO the user details entered in the registration form
     * @return ModelAndView to redirect to the login page after successful registration.
     */
    @PostMapping(value = "registerUser")
    public ModelAndView registerUser(@ModelAttribute RegisterVO registerVO, BindingResult result, HttpServletRequest request) {

        String errorMessage = "";
        // 1. Check if username (email) already exists in the system
        boolean usernameExists = registerService.usernameExists(registerVO.getUsername());
        if (usernameExists) {
            errorMessage = "Username already exists. Please choose a different username.";
            result.rejectValue("username", "error.registerVO", errorMessage);
        }

        // 2. Check password strength (custom validation)
        if (!result.hasErrors() && !isValidPassword(registerVO.getPassword())) {
            result.rejectValue("password", "error.registerVO", "Invalid password");
            errorMessage = "Password must contain at least one uppercase letter, one number, and be at least 6 characters long.";
        }

        // If there are any validation errors, return the user to the registration form with error messages
        if (result.hasErrors()) {
            // Pass the BindingResult as a model attribute to the view
            return new ModelAndView("errorPage")
                    .addObject("errorMessage", errorMessage)
                    .addObject("lastVisitedPage", request.getHeader("Referer"));
        }

        // Pass the RegisterVO to the service layer to handle the registration logic
        this.registerService.registerUser(registerVO);

        // After registration, redirect to the login page
        return new ModelAndView("redirect:/login");
    }

    // Custom validation method to check password strength
    private boolean isValidPassword(String password) {
        // Updated regex for password strength: at least one uppercase letter, one number, and 6+ characters
        String regex = "^(?=.*[A-Z])(?=.*\\d).{6,}$";
        return password.matches(regex);
    }
}
