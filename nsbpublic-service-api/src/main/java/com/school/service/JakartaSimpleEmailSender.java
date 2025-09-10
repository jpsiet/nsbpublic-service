package com.school.service;

import com.school.config.EmailProperties;
import com.school.dto.EmailRequest;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.stereotype.Service;
import java.util.Properties;


@Service
public class JakartaSimpleEmailSender implements EmailSender {

    private final EmailProperties properties;

    public JakartaSimpleEmailSender(EmailProperties properties) {
        this.properties = properties;
    }

    @Override
    public void sendEmail(EmailRequest request) {
        Properties props = new Properties();

        props.put("mail.smtp.auth", String.valueOf(properties.isAuth()));
        props.put("mail.smtp.starttls.enable", String.valueOf(properties.getStarttls().isEnable()));
        props.put("mail.smtp.host", properties.getHost());
        props.put("mail.smtp.port", String.valueOf(properties.getPort()));

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(properties.getUsername(), properties.getPassword());
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(properties.getUsername()));
            message.setRecipients(
                    Message.RecipientType.TO, InternetAddress.parse(request.getTo())
            );
            message.setSubject(request.getSubject());
            // for normal Messages
            //message.setText(request.getBody());

            message.setContent(request.getBody(), "text/html; charset=utf-8");

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException("Failed to send email", e);
        }
    }
}
