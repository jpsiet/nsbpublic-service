package com.school.model;



import lombok.*;

@Data
@Getter  // Lombok will generate the getter methods for all fields
@Setter  // Lombok will generate the setter methods for all fields
@AllArgsConstructor  // Lombok will generate a constructor with all fields
@NoArgsConstructor   // Lombok will generate a default no-args constructor
@ToString            // Lombok will generate a toString() method
public class Task {
    private String name;
    private String status;
}

