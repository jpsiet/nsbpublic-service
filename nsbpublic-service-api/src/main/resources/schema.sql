

-- Create Students Table
CREATE TABLE nsbpublic.students (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    age NUMBER,
    grade VARCHAR2(10),
    email VARCHAR2(100)
);

-- Create Teachers Table
CREATE TABLE nsbpublic.teachers (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    subject VARCHAR2(50),
     salary NUMBER,
    email VARCHAR2(100)
);

-- Create Courses Table
CREATE TABLE nsbpublic.courses (
    id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    teacher_id NUMBER REFERENCES nsbpublic.teachers(id),
    duration VARCHAR2(50)
);

-- Grant Privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON nsbpublic.students TO your_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON nsbpublic.teachers TO your_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON nsbpublic.courses TO your_user;
