package klu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import klu.model.Faculty;
import klu.model.FacultyManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@RestController
@RequestMapping("/faculty")
public class FacultyController {
	  private static final Logger logger = LoggerFactory.getLogger(FacultyController.class);
	@Autowired
	FacultyManager FM;
	
	@PostMapping("/save")
	public String FacultySave(@RequestBody Faculty F)
	{
		return FM.SaveFaculty(F);
	}
	@GetMapping("/readAll")
    public List<Faculty> getAllFaculties() {
        return FM.readData();
    }
	@PutMapping("/update")
	public String updateFaculty(@RequestBody Faculty F) {
	    logger.info("Received request to update faculty: {}", F);
	    try {
	        String result = FM.updateFacultyData(F);
	        logger.info("Faculty updated successfully: {}", F.getFacultyid());
	        return result;
	    } catch (Exception e) {
	        logger.error("Error updating faculty: {}", e.getMessage());
	        return e.getMessage(); // Return the error message
	    }
	}


}
