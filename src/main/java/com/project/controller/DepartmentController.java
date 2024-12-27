package com.project.controller;

import com.project.model.DepartmentVO;
import com.project.service.DepartmentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Controller class for handling Department related operations.
 * It handles adding, saving, viewing, deleting, and editing department records.
 */
@Controller
@RequiredArgsConstructor
@Slf4j
public class DepartmentController {

    private final DepartmentService departmentService;

    /**
     * Displays the form to add a new department.
     *
     * @return ModelAndView object containing the view name and a new DepartmentVO object for the form.
     */
    @GetMapping(value = "admin/addDepartment")
    public ModelAndView addDepartment() {
        return new ModelAndView("admin/addDepartment", "departmentVO", new DepartmentVO());
    }

    /**
     * Saves the department details submitted through the form.
     *
     * @param departmentVO the DepartmentVO object containing the details of the department to be saved.
     * @return a redirect to the "addDepartment" view.
     */
    @PostMapping(value = "admin/saveDepartment")
    public ModelAndView saveDepartment(@ModelAttribute DepartmentVO departmentVO, BindingResult result, HttpServletRequest request) {
        String errorMessage = "";

        // Check if department already exists in the system
        boolean departmentExists = departmentService.departmentExists(departmentVO.getDepartmentName());
        if (departmentExists) {
            errorMessage = "Department already exists. Please choose a different department name.";
            result.rejectValue("departmentName", "error.departmentVO", errorMessage);
        }

        // If there are any validation errors, return the user to the department form with error messages
        if (result.hasErrors()) {
            // Pass the BindingResult as a model attribute to the view
            return new ModelAndView("errorPage")
                    .addObject("errorMessage", errorMessage)
                    .addObject("lastVisitedPage", request.getHeader("Referer"));
        }

        // Log the department save operation
        log.info("Saving department: {}", departmentVO);

        // Save the department
        this.departmentService.save(departmentVO);

        // Redirect to the "addDepartment" page after saving
        return new ModelAndView("redirect:/admin/addDepartment");
    }

    /**
     * Displays the list of all departments in the system.
     *
     * @return ModelAndView object containing the view name and the list of departments.
     */
    @GetMapping(value = "admin/viewDepartment")
    public ModelAndView viewDepartment() {
        // Retrieve the list of all departments
        List<DepartmentVO> departmentList = this.departmentService.search();

        // Log the departments retrieved
        log.info("Fetching department list: {}", departmentList);

        // Return the view with the department list
        return new ModelAndView("admin/viewDepartment", "departmentList", departmentList);
    }

    /**
     * Marks a department as inactive and deleted based on its ID.
     *
     * @param departmentVO the DepartmentVO object to be updated.
     * @param id           the ID of the department to be deleted.
     * @return a redirect to the "viewDepartment" page after the update.
     */
    @GetMapping(value = "admin/deleteDepartment")
    public ModelAndView deleteDepartment(@ModelAttribute DepartmentVO departmentVO, @RequestParam int id) {
        // Fetch the department using the ID
        List<DepartmentVO> departmentList = this.departmentService.findById(id);

        // If the department is found, update its status
        if (!departmentList.isEmpty()) {
            departmentVO = departmentList.get(0);
            departmentVO.setActive(false); // Set as inactive
            departmentVO.setDelete(true); // Set as deleted

            // Save the updated department status
            this.departmentService.save(departmentVO);

            // Log the deletion action
            log.info("Deleted department with ID: {}", id);
        }

        // Redirect to the "viewDepartment" page to refresh the department list
        return new ModelAndView("redirect:/admin/viewDepartment");
    }

    /**
     * Displays the form to edit the department details.
     *
     * @param departmentVO the DepartmentVO object containing the details of the department to be edited.
     * @param id           the ID of the department to be edited.
     * @return ModelAndView object containing the view name and the department details for editing.
     */
    @GetMapping(value = "admin/editDepartment")
    public ModelAndView editDepartment(@ModelAttribute DepartmentVO departmentVO, @RequestParam int id) {
        // Fetch the department details by ID
        List<DepartmentVO> departmentList = this.departmentService.findById(id);

        // Return the form with the department details for editing
        if (!departmentList.isEmpty()) {
            return new ModelAndView("admin/addDepartment", "departmentVO", departmentList.get(0));
        } else {
            // Log if the department with the given ID was not found
            log.warn("Department with ID {} not found for editing", id);
            return new ModelAndView("redirect:/admin/viewDepartment");
        }
    }
}
