package com.school.service;



import com.school.dto.StudentModelIMMapper;
import com.school.entity.StudentEntity;

import com.school.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.school.repository.StudentRepository;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private StudentModelIMMapper studentMapperIm;

    public List<Student> getAllStudents() {
        List<StudentEntity> studentEntList = studentRepository.findAll();
        return  studentMapperIm.mapStudentEntListToStudent(studentEntList);
       }

    public Student getStudentById(Long id) {
          StudentEntity studentEntity = studentRepository.findById(id).orElse(null);
          return  studentMapperIm.studentEntitytToStudent(studentEntity);
        }

    public Student saveStudent(Student student) {
        StudentEntity sten = studentMapperIm.studentToStudentEntity(student);

                StudentEntity ste = studentRepository.save(sten);
        return studentMapperIm.studentEntitytToStudent(ste);
    }
//
//        public void deleteStudent(Long id) {
//            studentRepository.deleteById(id);
//    }
}
