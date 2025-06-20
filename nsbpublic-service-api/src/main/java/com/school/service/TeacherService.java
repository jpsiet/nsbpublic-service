package com.school.service;

import com.school.entity.TeacherEntity;
import com.school.entity.TeacherEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.repository.TeacherRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TeacherService {

    private final TeacherRepository teacherRepository;

    @Autowired
    public TeacherService(TeacherRepository teacherRepository) {
        this.teacherRepository = teacherRepository;
    }

    public TeacherEntity saveTeacher(TeacherEntity teacher) {
        return teacherRepository.save(teacher);
    }

    public List<TeacherEntity> getAllTeachers() {
        return teacherRepository.findAll();
    }

    public Optional<TeacherEntity> getTeacherById(Long id) {
        return teacherRepository.findById(id);
    }

//    public TeacherEntity getTeacherByEmail(String email) {
//        return teacherRepository.findByEmail(email);
//    }

    public void deleteTeacher(Long id) {
        teacherRepository.deleteById(id);
    }
}
