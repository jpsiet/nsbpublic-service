package com.school.dto;

import org.springframework.stereotype.Component;

import com.school.entity.Student;

@Component
public class StudentMapperImpl implements StudentMapper {

    @Override
    public Student toEntity(StudentDTO studentDTO) {
        if ( studentDTO == null ) {
            return null;
        }

        Student student = new Student();
       
//        student.setSubject( studentDTO.getSubjectArea() );
//        student.setEmail( studentDTO.getEmail() );

        return student;
    }

    @Override
    public StudentDTO toDto(Student student) {
        if ( student == null ) {
            return null;
        }

        StudentDTO studentDTO = new StudentDTO();
//        teacherDTO.setFullName( teacher.getName() );
//        teacherDTO.setSubjectArea( teacher.getSubject() );
//        teacherDTO.setEmail( teacher.getEmail() );

        return studentDTO;
    }
}

