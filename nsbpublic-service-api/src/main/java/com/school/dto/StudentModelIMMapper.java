package com.school.dto;

import com.school.entity.StudentEntity;
import com.school.model.Student;
import org.hibernate.annotations.Comment;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


@Component
public class StudentModelIMMapper  implements StudentMapper {

    @Override
    public List<Student> map(List<StudentEntity> studentEnt) {
        if (studentEnt == null) {
            return null;
        }

        List<Student> list = new ArrayList<>(studentEnt.size());
        for (StudentEntity studentEntity : studentEnt) {
            list.add(StudentEntitytToStudent(studentEntity));
        }

        return list;
    }

    protected Student StudentEntitytToStudent(StudentEntity studentEnt) {
        if (studentEnt == null) {
            return null;
        }

        Student student = new Student();

        student.setId(BigDecimal.valueOf(studentEnt.getId()));
        student.setName(studentEnt.getName());
        student.setAge(BigDecimal.valueOf(studentEnt.getAge()));
        student.setEmail(studentEnt.getEmail());
        student.setGrade(studentEnt.getGrade());

        return student;
    }

}