package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import klu.model.Student;

public interface StudentRepository extends JpaRepository<Student, Long> {
	@Query("select count(s) from Student s where s.username=:uname")
	public int validateUsername(@Param("uname") String uname);
    /*@Query("SELECT COUNT(s) from Student s WHERE s.username=:uname and s.password=:pwd")
	public int validateCredentials(@Param("uname") String  uname, @Param("pwd") String pwd);*/
    
}
