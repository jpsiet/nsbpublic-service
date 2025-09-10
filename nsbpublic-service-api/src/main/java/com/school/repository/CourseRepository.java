package com.school.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.school.entity.Course;


public interface CourseRepository extends JpaRepository<Course, Long> {
    // Custom queries if needed (e.g., findByName)
  //  List<Course> findByTeacher(Teacher teacher);
}
