package com.school.dto;

import com.school.entity.StudentEntity;
import com.school.model.Student;
import org.mapstruct.Mapper;

import java.util.List;


@Mapper(componentModel = "spring")  // "spring" will register it as a Spring Bean automatically

public interface StudentMapper {

    List<Student> map(List<StudentEntity> employees);
}
