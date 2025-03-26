package com.school.dto;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;
import org.springframework.stereotype.Component;

import com.school.entity.Student;

@Mapper(componentModel = "spring")  // "spring" will register it as a Spring Bean automatically

public interface StudentMapper {
 
  	
	StudentMapper  INSTANCE = Mappers.getMapper(StudentMapper.class);
	
	
	
	
	 // Map DTO to Entity
    @Mapping(source = "fullName", target = "name")  // Map 'fullName' from DTO to 'name' in Entity
    @Mapping(source = "emailId", target = "email")  // Map 'subjectArea' from DTO to 'subject' in Entity
	Student toEntity(StudentDTO  studentDTO);

    // Map Entity to DTO
    @Mapping(source = "name", target = "fullName")  // Map 'name' from Entity to 'fullName' in DTO
    @Mapping(source = "email", target = "emailId")  // Map 'subject' from Entity to 'subjectArea' in DTO
    StudentDTO toDto(Student  student);
	
}
