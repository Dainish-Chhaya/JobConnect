package com.project.controller;

import com.project.model.DesignationVO;
import com.project.service.DesignationService;
import lombok.RequiredArgsConstructor;
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
 * Controller class responsible for handling the CRUD operations of Designation.
 * This includes adding, saving, viewing, deleting, and editing designations.
 */
@Controller
@RequiredArgsConstructor
public class DesignationController {

    private final DesignationService designationService;

    /**
     * Displays the form for adding a new designation.
     *
     * @return ModelAndView object containing the view name and a new DesignationVO object for the form.
     */
    @GetMapping(value = "admin/addDesigntion")
    public ModelAndView addDesigntion() {
        // Return the add designation form with an empty DesignationVO object.
        return new ModelAndView("admin/addDesigntion", "designationVO", new DesignationVO());
    }

    /**
     * Saves the new or updated designation.
     *
     * @param designationVO the DesignationVO object containing the details of the designation to be saved.
     * @return a redirect to the "addDesigntion" view after saving.
     */
    @PostMapping(value = "admin/saveDesignation")
    public ModelAndView saveDesigntion(@ModelAttribute DesignationVO designationVO, BindingResult result, HttpServletRequest request) {
        String errorMessage = "";

        // Check if designation already exists in the system
        boolean designationExists = designationService.designationExists(designationVO.getDesignationName());
        if (designationExists) {
            errorMessage = "Designation already exists. Please choose a different designation name.";
            result.rejectValue("designationName", "error.designationVO", errorMessage);
        }

        // If there are any validation errors, return the user to the department form with error messages
        if (result.hasErrors()) {
            // Pass the BindingResult as a model attribute to the view
            return new ModelAndView("errorPage")
                    .addObject("errorMessage", errorMessage)
                    .addObject("lastVisitedPage", request.getHeader("Referer"));
        }
        // Save the designation to the database
        this.designationService.save(designationVO);

        // Redirect to the "addDesignation" page after saving
        return new ModelAndView("redirect:/admin/addDesigntion");
    }

    /**
     * Displays the list of all designations.
     *
     * @return ModelAndView object containing the view name and the list of all designations.
     */
    @GetMapping(value = "admin/viewDesigntion")
    public ModelAndView viewDesigntion() {
        // Retrieve the list of all designations from the service
        List<DesignationVO> designationList = this.designationService.search();

        // Return the view with the list of designations
        return new ModelAndView("admin/viewDesigntion", "designationList", designationList);
    }

    /**
     * Marks a designation as inactive (soft delete) based on its ID.
     *
     * @param designationVO the DesignationVO object to be updated.
     * @param id            the ID of the designation to be deleted.
     * @return a redirect to the "viewDesigntion" page after marking the designation as deleted.
     */
    @GetMapping(value = "admin/deleteDesignation")
    public ModelAndView deleteDesignation(@ModelAttribute DesignationVO designationVO, @RequestParam int id) {
        // Fetch the designation by ID
        List<DesignationVO> designationList = this.designationService.findByID(id);

        // If the designation exists, set it as inactive (soft delete)
        if (!designationList.isEmpty()) {
            designationVO = designationList.get(0);
            designationVO.setActive(false);  // Set as inactive
            // Save the updated designation
            this.designationService.save(designationVO);
        }

        // Redirect to the "viewDesignation" page to refresh the list
        return new ModelAndView("redirect:/admin/viewDesigntion");
    }

    /**
     * Displays the form to edit the details of a designation.
     *
     * @param designationVO the DesignationVO object containing the designation details to be edited.
     * @param id            the ID of the designation to be edited.
     * @return ModelAndView object containing the view name and the designation details for editing.
     */
    @GetMapping(value = "admin/editDesignation")
    public ModelAndView editDesignation(@ModelAttribute DesignationVO designationVO, @RequestParam int id) {
        // Fetch the designation by ID
        List<DesignationVO> designationList = this.designationService.findByID(id);

        // Return the form to edit the designation with the existing data
        return new ModelAndView("admin/addDesigntion", "designationVO", designationList.get(0));
    }

}
