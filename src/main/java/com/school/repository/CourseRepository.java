package com.school.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.school.entity.Course;
import com.school.entity.Teacher;

public interface CourseRepository extends JpaRepository<Course, Long> {
    // Custom queries if needed (e.g., findByName)
    List<Course> findByTeacher(Teacher teacher);
}
