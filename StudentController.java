package klu.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import klu.model.Student;
import klu.model.StudentManager;


@RestController
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentManager SM;
	@PostMapping("/save")
	public String saveStudent(@RequestBody Student S)
	{
		return SM.studentSave(S);
	}
	/*@PostMapping("/studentlogin")
    public String studentLogin(@RequestBody Student S) { // Ensure to use @RequestBody
        return SM.loginStudent(S.getUsername(), S.getPassword());
	}*/
}
