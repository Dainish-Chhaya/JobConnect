package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "recruiter_master")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecruiterVO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "First name cannot be empty")
    @Size(min = 2, max = 50, message = "First name must be between 2 and 50 characters")
    @Column(name = "first_name")
    private String firstName;

    @NotEmpty(message = "Last name cannot be empty")
    @Size(min = 2, max = 50, message = "Last name must be between 2 and 50 characters")
    @Column(name = "last_name")
    private String lastName;

    @NotEmpty(message = "Email cannot be empty")
    @Email(message = "Please provide a valid email address")
    @Column(name = "email")
    private String email;

//    @Pattern(regexp = "^[0-9]{10}$", message = "Contact number must be a 10-digit number")
    @Column(name = "contact")
    private String contact;

    @Size(min = 2, max = 100, message = "Company name must be between 2 and 100 characters")
    @Column(name = "company_name")
    private String companyName;

    @Size(min = 5, max = 200, message = "Address must be between 5 and 200 characters")
    @Column(name = "address")
    private String address;

    @Email(message = "Please provide a valid company email address")
    @Column(name = "company_email")
    private String companyEmail;

//    @Pattern(regexp = "^[0-9]{10}$", message = "Company contact number must be a 10-digit number")
    @Column(name = "company_contact")
    private String companyContact;

    @Column(name = "company_website")
    private String companyWebsite;

    @Column(name = "is_profile_complete")
    private boolean isProfileComplete = false;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserVO userVO;
}
