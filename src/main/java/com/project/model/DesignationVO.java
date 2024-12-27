package com.project.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Table(name = "designation_master")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DesignationVO {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty(message = "Designation name cannot be empty")
    @Size(min = 2, max = 100, message = "Designation name must be between 2 and 100 characters")
    @Column(name = "designation")
    private String designationName;

    @NotEmpty(message = "Designation description cannot be empty")
    @Size(min = 4, max = 500, message = "Designation description must be between 5 and 500 characters")
    @Column(name = "description")
    private String designationDescription;

    @NotNull(message = "Active status cannot be null")
    @Column(name = "is_active")
    private boolean isActive = true;

    @NotNull(message = "Delete status cannot be null")
    @Column(name = "is_delete")
    private boolean isDelete = false;
}
