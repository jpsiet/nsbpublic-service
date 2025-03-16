-- data.sql (in src/main/resources)

INSERT INTO student (name, age, grade, email) VALUES ('John Doe', 15, '10', 'john.doe@example.com');
INSERT INTO teacher (name, subject, email) VALUES ('Jane Smith', 'Math', 'jane.smith@example.com');

-- Inserting initial data for Teachers
INSERT INTO teachers (name, subject, email) 
VALUES ('Mrs. Johnson', 'Math', 'mrs.johnson@example.com');
INSERT INTO teachers (name, subject, email) 
VALUES ('Mr. Brown', 'History', 'mr.brown@example.com');

-- Inserting initial data for Courses
INSERT INTO courses (name, teacher_id, duration) 
VALUES ('Math 101', 1, '1 Year');
INSERT INTO courses (name, teacher_id, duration) 
VALUES ('History 101', 2, '1 Year');