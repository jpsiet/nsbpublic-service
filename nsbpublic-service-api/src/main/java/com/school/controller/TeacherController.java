package com.school.controller;

import com.school.api.TeachersApi;
import com.school.entity.TeacherEntity;
import com.school.model.Teacher;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.school.service.TeacherService;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
public class TeacherController  implements TeachersApi {

	@Autowired
    private  TeacherService teacherService;

    @Autowired
    private ModelMapper modelMapper;


    @Override
    public ResponseEntity<Long> addTeacher(@RequestBody Teacher teacher) {
       TeacherEntity teacherEnt =  modelMapper.map(teacher, TeacherEntity.class);
        Long salary;
        switch (teacherEnt.getDepartment().toLowerCase()) {
            case "science":
                salary = 70000L;
                break;
            case "hr":
                salary = 50000L;
                break;
            case "finance":
                salary = 60000L;
                break;
            default:
                salary = 40000L;
                break;
        }
        teacherEnt.setSalary(salary);

        TeacherEntity saveTeacherentity = teacherService.saveTeacher(teacherEnt);
        Teacher savedTeacher =  modelMapper.map(saveTeacherentity, Teacher.class);
        return new ResponseEntity<>(savedTeacher.getId(), HttpStatus.CREATED);
    }

    @Override
    public ResponseEntity<List<Teacher>> getAllTeachers() {
        List<TeacherEntity> teachersEntList = teacherService.getAllTeachers();
        List<Teacher> teachersList =    teachersEntList.stream()
                .map(teachersEnt ->  modelMapper.map(teachersEnt, Teacher.class))
                .collect(Collectors.toList());
        return new ResponseEntity<>(teachersList, HttpStatus.OK);
    }

        @Override
        public ResponseEntity<Teacher> getTeacherById(@PathVariable Long id) {
            Optional<TeacherEntity> teacherEnt = teacherService.getTeacherById(id);
            Teacher savedTeacher =  modelMapper.map(teacherEnt, Teacher.class);
            return new ResponseEntity<>(savedTeacher, HttpStatus.OK);
        }

}
