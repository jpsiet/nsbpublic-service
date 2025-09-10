package com.school.service;


import com.school.config.EmailProperties;
import com.school.model.Task;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.util.List;
import java.util.Properties;

@Service
public class JakartaFormattedEmailSender {

    private final EmailProperties properties;
    private final TemplateEngine templateEngine;

    public JakartaFormattedEmailSender(EmailProperties properties, TemplateEngine templateEngine) {
        this.properties = properties;
        this.templateEngine = templateEngine;
    }

    public void sendEmail(String to, String subject, List<Task> tasks) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", String.valueOf(properties.isAuth()));
        props.put("mail.smtp.starttls.enable", String.valueOf(properties.getStarttls().isEnable()));
        props.put("mail.smtp.host", properties.getHost());
        props.put("mail.smtp.port", String.valueOf(properties.getPort()));
        props.put("mail.debug", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(properties.getUsername(), properties.getPassword());
            }
        });

        try {
            // Prepare the HTML body using Thymeleaf
            Context context = new Context();
            context.setVariable("tasks", tasks);
            String htmlContent = templateEngine.process("email-table", context);

            // Create the email message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(properties.getUsername()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(htmlContent, "text/html; charset=utf-8");

            Transport.send(message);
            System.out.println("Email sent!");

        } catch (MessagingException e) {
            throw new RuntimeException("Failed to send email", e);
        }
    }
}

