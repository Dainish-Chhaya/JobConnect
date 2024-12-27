package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Table(name = "user_master")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty(message = "Username cannot be empty")
    @Size(min = 4, max = 30, message = "Username must be between 4 and 30 characters")
    @Email(message = "Email should be valid")
    @Column(name = "username")
    private String username;

    @NotEmpty(message = "Password cannot be empty")
    @Size(min = 6, max = 100, message = "Password must be between 6 and 100 characters")
    @Column(name = "password")
    private String password;

    @NotEmpty(message = "Role cannot be empty")
    @Column(name = "role")
    private String role;

    @NotNull(message = "Active status cannot be null")
    @Column(name = "is_active")
    private boolean isActive = true;

    @NotNull(message = "Delete status cannot be null")
    @Column(name = "is_delete")
    private boolean isDelete = false;

}
