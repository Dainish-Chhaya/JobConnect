package com.project.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Configuration  // Marks the class as a configuration class for Spring context.
@EnableWebSecurity  // Enables web security for the application.
@RequiredArgsConstructor // Lombok annotation to generate a constructor with required fields.
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private final CustomizeAuthenticationSuccessHandler customizeAuthenticationSuccessHandler;  // Custom handler for authentication success events.

    private final DataSource dataSource;  // DataSource for connecting to the database.

    @Value("${spring.queries.users-query}")
    private String usersQuery;  // SQL query to fetch users from the database.

    @Value("${spring.queries.roles-query}")
    private String rolesQuery;  // SQL query to fetch user roles from the database.

    // Configure authentication with JDBC authentication using custom SQL queries
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .jdbcAuthentication()
                .usersByUsernameQuery(usersQuery)  // SQL query to fetch user details.
                .authoritiesByUsernameQuery(rolesQuery)  // SQL query to fetch roles of the user.
                .dataSource(dataSource)  // Use the DataSource for the database connection.
                .passwordEncoder(NoOpPasswordEncoder.getInstance());  // Use NoOpPasswordEncoder for simplicity (not recommended for production).
//                .passwordEncoder(passwordEncoder());  // Use Bcrypt Password encoder for enhanced security (recommended for production).
    }

    // Configure HTTP security settings (login, authorization, CSRF, etc.)
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // Disable CSRF protection (not recommended for production without careful consideration).
        http.csrf().disable();

        // Public pages that can be accessed without authentication
        http.authorizeRequests()
                .antMatchers("/", "/login", "/logout")  // Allow access to these URLs without login.
                .permitAll();

        // URLs that require login with the 'ROLE_RECRUITER' authority.
        http.authorizeRequests()
                .antMatchers("/recruiter/**")
                .access("hasAnyRole('ROLE_RECRUITER')");

        // URLs that require login with the 'ROLE_CANDIDATE' authority.
        http.authorizeRequests()
                .antMatchers("/candidate/**")
                .access("hasAnyRole('ROLE_CANDIDATE')");

        // URLs that are restricted to the 'ROLE_ADMIN' authority.
        http.authorizeRequests()
                .antMatchers("/admin/**")
                .access("hasRole('ROLE_ADMIN')");

        // If the user tries to access a page they don't have permission for, redirect to the 403 error page.
        http.authorizeRequests()
                .and()
                .exceptionHandling()
                .accessDeniedPage("/403");

        // Configure form-based login.
        http.authorizeRequests()
                .and()
                .formLogin()
                .loginProcessingUrl("/j_spring_security_check")  // URL to submit login credentials.
                .successHandler(customizeAuthenticationSuccessHandler)  // Custom handler for login success.
                .loginPage("/login")  // Login page URL.
                .failureUrl("/login?error=true")  // Redirect URL in case of login failure.
                .usernameParameter("username")  // Form field name for the username.
                .passwordParameter("password")  // Form field name for the password.

                // Configure logout functionality.
                .and().logout().permitAll();  // Allow all users to logout.

        // Configure Remember Me functionality.
        http.authorizeRequests()
                .and()
                .rememberMe()
                .tokenRepository(this.persistentTokenRepository())  // Use an in-memory token repository.
                .tokenValiditySeconds(24 * 60 * 60);  // Token validity set to 24 hours (in seconds).
    }

    // Bean to create an in-memory token repository for Remember Me functionality.
    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        return new InMemoryTokenRepositoryImpl();  // In-memory token storage (not persistent across server restarts).
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();  // Use BCryptPasswordEncoder for password hashing.
    }
}
