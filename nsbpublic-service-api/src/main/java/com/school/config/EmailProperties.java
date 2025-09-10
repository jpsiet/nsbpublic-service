package com.school.config;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Data
@Configuration
@ConfigurationProperties(prefix = "email.smtp")
public class EmailProperties {
    private String host;
    private int port;
    private String username;
    private String password;
    private boolean auth;
    private StartTls starttls;

    @Data
    public static class StartTls {
        private boolean enable;
    }
}

