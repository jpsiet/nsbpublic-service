package com.school.service;

import com.school.dto.EmailRequest;

public interface EmailSender {
    void sendEmail(EmailRequest request);
}
