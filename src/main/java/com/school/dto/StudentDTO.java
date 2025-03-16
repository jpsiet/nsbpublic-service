package com.school.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter // Lombok will generate the getter methods for all fields
@Setter // Lombok will generate the setter methods for all fields
@AllArgsConstructor // Lombok will generate a constructor with all fields
@NoArgsConstructor // Lombok will generate a default no-args constructor
@ToString // Lombok will generate a toString() method
public class StudentDTO {

	private String firstName;
	private int age;
	private String grade;
	private String emailId;

}
