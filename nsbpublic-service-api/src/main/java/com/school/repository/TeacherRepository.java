package com.school.repository;

import com.school.entity.TeacherEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface TeacherRepository extends JpaRepository<TeacherEntity, Long> {
    // Custom queries if needed (e.g., findByEmail)
//    Teacherentity findByEmail(String email);
}

