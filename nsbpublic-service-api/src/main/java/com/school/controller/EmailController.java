package com.school.controller;

import com.school.dto.EmailRequest;

import com.school.dto.EmailTaskRequest;
import com.school.model.Task;
import com.school.service.JakartaFormattedEmailSender;
import com.school.service.JakartaSimpleEmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/email")
public class EmailController {

    @Autowired
    private JakartaSimpleEmailSender simpleEmailSender;

    @Autowired
    private JakartaFormattedEmailSender formattedEmailSender;


    @PostMapping("/simple-email")
    public String sendEmail(@RequestBody EmailRequest emailReq) {
        simpleEmailSender.sendEmail(emailReq);
        return "Email sent successfully";
    }

    @PostMapping("/formatted-email")
    public String sendTableEmail(@RequestBody EmailTaskRequest request) {
        formattedEmailSender.sendEmail(request.getTo(), request.getSubject(), request.getTasks());
        return "Formatted  email sent!";
    }

}
