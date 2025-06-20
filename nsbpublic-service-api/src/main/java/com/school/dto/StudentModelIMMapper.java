package com.school.dto;

import com.school.entity.StudentEntity;
import com.school.model.Student;
import com.school.service.StudentServiceDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Component
public class StudentModelIMMapper   {

    @Autowired
     private StudentServiceDTO studentServiceDTO;
    public List<Student> mapStudentEntListToStudent(List<StudentEntity> studentEntlist) {
        return  studentEntlist.stream()
                        .map(studentEntity -> this.studentServiceDTO.convertToDto(studentEntity))
                       .collect(Collectors.toList());
    }

    public Student studentEntitytToStudent(StudentEntity studentEnt) {
         return  this.studentServiceDTO.convertToDto(studentEnt);
    }

    public StudentEntity studentToStudentEntity(Student  student) {
         return  this.studentServiceDTO.convertToEntity(student);
    }

}