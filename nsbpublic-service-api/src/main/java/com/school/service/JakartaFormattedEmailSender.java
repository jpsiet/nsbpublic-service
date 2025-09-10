package com.school.service;


import com.school.config.EmailProperties;
import com.school.model.Task;
import jakarta.activation.DataHandler;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.mail.util.ByteArrayDataSource;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.ByteArrayOutputStream;
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



// ... other imports

    public void sendEmailWithPdf(String to, List<String> ccList, String subject, List<Task> tasks) {
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
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(properties.getUsername()));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

            if (ccList != null && !ccList.isEmpty()) {
                Address[] ccAddresses = ccList.stream().map(addr -> {
                    try {
                        return new InternetAddress(addr);
                    } catch (AddressException e) {
                        throw new RuntimeException(e);
                    }
                }).toArray(Address[]::new);

                message.setRecipients(Message.RecipientType.CC, ccAddresses);
            }

            message.setSubject(subject);

            // Prepare HTML body from Thymeleaf
            Context context = new Context();
            context.setVariable("tasks", tasks);
            String htmlContent = templateEngine.process("email-table", context);

            // Build the multipart message (HTML + Attachment)
            Multipart multipart = new MimeMultipart();

            // Part 1: HTML body
            MimeBodyPart htmlPart = new MimeBodyPart();
            htmlPart.setContent(htmlContent, "text/html; charset=utf-8");
            multipart.addBodyPart(htmlPart);

            // Part 2: PDF attachment
            MimeBodyPart attachmentPart = new MimeBodyPart();
            ByteArrayOutputStream pdfStream = generatePdf(tasks);
            attachmentPart.setDataHandler(new DataHandler(
                    new ByteArrayDataSource(pdfStream.toByteArray(), "application/pdf")
            ));
            attachmentPart.setFileName("task-report.pdf");
            multipart.addBodyPart(attachmentPart);

            message.setContent(multipart);

            Transport.send(message);
            System.out.println("Email with PDF and CC sent!");

        } catch (Exception e) {
            throw new RuntimeException("Failed to send email with PDF", e);
        }
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

    private ByteArrayOutputStream generatePdf(List<Task> tasks) throws Exception {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, out);
        document.open();

        Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
        Font bodyFont = FontFactory.getFont(FontFactory.HELVETICA);

        document.add(new Paragraph("Task Report", headerFont));
        document.add(new Paragraph(" ")); // spacer

        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.setWidths(new int[]{3, 3});

        PdfPCell h1 = new PdfPCell(new Phrase("Task", headerFont));
        PdfPCell h2 = new PdfPCell(new Phrase("Status", headerFont));
        table.addCell(h1);
        table.addCell(h2);

        for (Task task : tasks) {
            table.addCell(new PdfPCell(new Phrase(task.getName(), bodyFont)));
            table.addCell(new PdfPCell(new Phrase(task.getStatus(), bodyFont)));
        }

        document.add(table);
        document.close();

        return out;
    }

}

