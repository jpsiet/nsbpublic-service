package com.school.service;

import com.school.entity.StudentEntity;
import com.school.model.Student;
import org.hibernate.annotations.Comment;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StudentServiceDTO {

    @Autowired
    private ModelMapper modelMapper;

    public StudentEntity convertToEntity(Student student) {
        return modelMapper.map(student, StudentEntity.class);
    }

    public Student convertToDto(StudentEntity entity) {
        return modelMapper.map(entity, Student.class);
    }
}