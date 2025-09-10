package com.school.controller;

import com.school.dto.EmailRequest;
import com.school.entity.Course;

import com.school.service.JakartaEmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/email")
public class EmailController {

    @Autowired
    private JakartaEmailSender emailService;

    @PostMapping("/send")
    public String sendEmail(@RequestBody EmailRequest emailReq) {
        emailService.sendEmail(emailReq);
        return "Email sent successfully";
    }
}
