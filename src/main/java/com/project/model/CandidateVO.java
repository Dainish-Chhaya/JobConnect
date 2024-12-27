package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.List;

@Entity
@Data
@Table(name = "candidate_master")
@AllArgsConstructor
@NoArgsConstructor
public class CandidateVO {

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

    @Email(message = "Email should be valid")
    @NotEmpty(message = "Email cannot be empty")
    @Column(name = "email")
    private String email;

//    @Pattern(regexp = "^[0-9]{10}$", message = "Contact should be a valid 10-digit number")
    @Column(name = "contact")
    private String contact;

    @Column(name = "address")
    private String address;

    @Column(name = "college_name")
    private String collegeName;

    @Column(name = "degree")
    private String degree;

    @Column(name = "skills")
    private String skills;

    @Column(name = "is_profile_complete")
    private boolean isProfileComplete = false;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserVO userVO;
}
