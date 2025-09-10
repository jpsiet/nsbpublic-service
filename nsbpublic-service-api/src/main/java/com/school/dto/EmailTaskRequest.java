package com.school.dto;

import com.school.model.Task;
import lombok.Data;

import java.util.List;

@Data
public class EmailTaskRequest {
    private String to;
    private String subject;
    private List<Task> tasks;
}
