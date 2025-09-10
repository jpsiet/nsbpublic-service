package com.school.controller;

import com.school.dto.EmailRequest;

import com.school.dto.EmailTaskRequest;
import com.school.model.Task;
import com.school.service.JakartaFormattedEmailSender;
import com.school.service.JakartaSimpleEmailSender;
import com.school.utils.Utils;
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


    @PostMapping("/email-simple")
    public String sendEmail(@RequestBody EmailRequest emailReq) {
        simpleEmailSender.sendEmail(emailReq);
        return "Email sent successfully";
    }

    @PostMapping("/email-formatted")
    public String sendFormattedEmail(@RequestBody EmailTaskRequest request) {

        String subject = Utils.fallbackIfBlank(request.getSubject(), "Default Subject");
        formattedEmailSender.sendEmail(request.getTo(),subject, request.getTasks());
        return "Formatted  email sent!";
    }

    @PostMapping("/email-pdf")
    public String sendPdfEmail(@RequestBody EmailTaskRequest request) {
        formattedEmailSender.sendEmailWithPdf(
                request.getTo(),
                request.getCc(),
                request.getSubject(),
                request.getTasks()
        );
        return "Task email with PDF sent!";
    }


}
