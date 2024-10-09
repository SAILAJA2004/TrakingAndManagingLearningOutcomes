package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.StudentRepository;


@Service
public class StudentManager {

	@Autowired
	StudentRepository SR;
	
	
	public String studentSave(Student S)
	{
		
		try
		{
			if(SR.validateUsername(S.username)>0)
				throw new Exception("401");
				
			SR.save(S);
			return "200";
		}catch(Exception e)
		{
			return e.getMessage();
		}
	}
	/*public String loginStudent(String uname, String pwd) {
        try {
            if (SR.validateCredentials(uname, pwd) == 0)
                throw new Exception("401"); // Invalid credentials

            return "200"; // Login successful
        } catch (Exception e) {
            return e.getMessage(); // Return error message
        }
    }*/
	
}
