package com.school.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.school.entity.Course;

import com.school.repository.CourseRepository;
import com.school.repository.TeacherRepository;

import java.util.List;
import java.util.Optional;

@Service
public class CourseService {

    private final CourseRepository courseRepository;
    private final TeacherRepository teacherRepository;

    @Autowired
    public CourseService(CourseRepository courseRepository, TeacherRepository teacherRepository) {
        this.courseRepository = courseRepository;
        this.teacherRepository = teacherRepository;
    }

    public Course saveCourse(Course course) {
        return courseRepository.save(course);
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Optional<Course> getCourseById(Long id) {
        return courseRepository.findById(id);
    }

//    public List<Course> getCoursesByTeacher(Long teacherId) {
//        Teacher teacher = teacherRepository.findById(teacherId).orElse(null);
//        return courseRepository.findByTeacher(teacher);
//    }

    public void deleteCourse(Long id) {
        courseRepository.deleteById(id);
    }
}
