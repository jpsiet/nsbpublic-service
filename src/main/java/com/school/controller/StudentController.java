package com.school.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.school.dto.StudentDTO;
import com.school.dto.StudentMapper;
import com.school.entity.Student;
import com.school.service.StudentService;

import java.util.List;

@RestController
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping
    public List<Student> getAllStudents() {
    	List<Student>  studentLs=  studentService.getAllStudents();
        return  studentLs;
    }

    @GetMapping("/{id}")
    public Student getStudent(@PathVariable Long id) {
        return studentService.getStudentById(id);
    }

    @PostMapping
    public Student addStudent(@RequestBody StudentDTO studentDto) {
    	
    	Student student = StudentMapper.INSTANCE.toEntity(studentDto);
        return studentService.addStudent(student);
    }

    @DeleteMapping("/{id}")
    public void deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(id);
    }
}

