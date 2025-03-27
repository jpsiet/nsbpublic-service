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
        return  studentMapperIm.map(studentEntList);
        //return  studentEntList;

    }

//    public Student getStudentById(Long id) {
//            return studentRepository.findById(id).orElse(null);
//        }
//
//        public Student addStudent(Student student) {
//            return studentRepository.save(student);
//        }
//
//        public void deleteStudent(Long id) {
//            studentRepository.deleteById(id);
//    }
}
