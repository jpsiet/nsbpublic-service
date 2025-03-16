package com.school.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.school.entity.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Long> {
    // Custom queries if needed (e.g., findByEmail)
    Teacher findByEmail(String email);
}

