package com.school.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter  // Lombok will generate the getter methods for all fields
@Setter  // Lombok will generate the setter methods for all fields
@AllArgsConstructor  // Lombok will generate a constructor with all fields
@NoArgsConstructor   // Lombok will generate a default no-args constructor
@ToString            // Lombok will generate a toString() method
public class Teacher {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String subject;
    private String email;

    // Getters and Setters
}
