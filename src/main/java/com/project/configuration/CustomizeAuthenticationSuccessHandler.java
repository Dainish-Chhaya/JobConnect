package com.project.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.IOException;

@Component
@Transactional
@Slf4j  // Lombok annotation for logging
public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    // This method is called when authentication is successful
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException {
        // Set the response status to 200 OK (successful)
        response.setStatus(HttpServletResponse.SC_OK);

        // Initialize boolean flags for roles
        boolean admin = false;
        boolean recruiter = false;
        boolean candidate = false;

        // Log the successful authentication attempt
        log.info("Authentication successful for user: {}", authentication.getName());

        // Iterate over the granted authorities (roles) assigned to the authenticated user
        for (GrantedAuthority auth : authentication.getAuthorities()) {
            // Check if the user has the "ROLE_ADMIN" authority
            if ("ROLE_ADMIN".equals(auth.getAuthority())) {
                admin = true;
                log.info("User has ROLE_ADMIN");
            }
            // Check if the user has the "ROLE_RECRUITER" authority
            else if ("ROLE_RECRUITER".equals(auth.getAuthority())) {
                recruiter = true;
                log.info("User has ROLE_RECRUITER");
            }
            // Check if the user has the "ROLE_CANDIDATE" authority
            else {
                candidate = true;
                log.info("User has ROLE_CANDIDATE");
            }
        }
        // Redirect based on the user's role
        if (admin) {
            // Log and redirect to the Admin dashboard
            log.info("Redirecting admin to /admin/index");
            response.sendRedirect("/admin/index");
        } else if (recruiter) {
            // Log and redirect to the Recruiter's profile page
            log.info("Redirecting recruiter to /recruiter/checkProfile");
            response.sendRedirect("/recruiter/checkProfile");
        } else if (candidate) {
            // Log and redirect to the Candidate's profile page
            log.info("Redirecting candidate to /candidate/checkProfile");
            response.sendRedirect("/candidate/checkProfile");
        } else {
            // If the role is not recognized, log an error and redirect to a forbidden page
            log.error("User has an unrecognized role, redirecting to /403");
            response.sendRedirect("/403");
        }
    }
}
