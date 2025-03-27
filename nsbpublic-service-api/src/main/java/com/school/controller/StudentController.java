package com.school.controller;



import com.school.api.DefaultApi;
import com.school.model.Student;
import com.school.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;



import java.util.List;


@RestController

public class StudentController implements DefaultApi {

    @Autowired
    private StudentService studentService;



//
//    @PostMapping
//    public ResponseEntity<Course> createCourse(@RequestBody Course course) {
//        Course savedCourse = courseService.saveCourse(course);
//        return new ResponseEntity<>(savedCourse, HttpStatus.CREATED);
//    }


     @Override
    public ResponseEntity<List<Student>> getAllStudents() {
        List<Student> student = studentService.getAllStudents();
        return new ResponseEntity<>(student, HttpStatus.OK);
    }

//    @GetMapping("/{id}")
//    public ResponseEntity<Course> getCourseById(@PathVariable Long id) {
//        Optional<Course> course = courseService.getCourseById(id);
//        return course.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
//    }
//
//    @GetMapping("/teacher/{teacherId}")
//    public ResponseEntity<List<Course>> getCoursesByTeacher(@PathVariable Long teacherId) {
//        List<Course> courses = courseService.getCoursesByTeacher(teacherId);
//        return new ResponseEntity<>(courses, HttpStatus.OK);
//    }
//
//    @DeleteMapping("/{id}")
//    public ResponseEntity<Void> deleteCourse(@PathVariable Long id) {
//        courseService.deleteCourse(id);
//        return ResponseEntity.noContent().build();
//    }
}
