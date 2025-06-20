package com.school.controller;

import com.school.api.StudentsApi;
import com.school.model.Student;
import com.school.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.Optional;
@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class StudentController implements StudentsApi {

    @Autowired
    private StudentService studentService;

    @Override
    public ResponseEntity<Long> addStudent(@RequestBody Student student) {
        Student savedstudent = studentService.saveStudent(student);
        return new ResponseEntity<>(savedstudent.getId().longValue(),HttpStatus.CREATED);
    }


     @Override
    public ResponseEntity<List<Student>> getAllStudents() {
        List<Student> student = studentService.getAllStudents();
        // Return a ResponseEntity with the list of students and HTTP status OK (200)
        // This allows for better control over the HTTP response
        // For example, if no students are found, you could return an empty list with 200 OK
        if (student.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT); // 204 No Content
        }
        return new ResponseEntity<>(student, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Student> getStudentById(Long id) {

        Optional<Student> student = Optional.ofNullable(studentService.getStudentById(id));
        return student.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

}
