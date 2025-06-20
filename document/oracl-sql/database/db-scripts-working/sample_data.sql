/*
Sample data for the Introduction to Oracle SQL course
*/


DROP TABLE customer_order;
DROP TABLE customer;
DROP TABLE product;
DROP TABLE employee;
DROP TABLE department;


CREATE TABLE department (
  department_id NUMBER(5),
  department_name VARCHAR2(100),
  CONSTRAINT pk_dept PRIMARY KEY (department_id)
);


CREATE TABLE employee (
  employee_id NUMBER(5),
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  salary NUMBER(8),
  department_id NUMBER(5),
  manager_id NUMBER(5),
  hire_date DATE,
  CONSTRAINT pk_emp PRIMARY KEY (employee_id),
  CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES department(department_id)
);


CREATE TABLE product (
  product_id NUMBER(5),
  product_name VARCHAR2(100),
  price NUMBER(10, 2),
  department_id NUMBER(5),
  CONSTRAINT pk_prod PRIMARY KEY (product_id),
  CONSTRAINT fk_prod_dept FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE customer (
  customer_id NUMBER(5),
  first_name VARCHAR2(100),
  last_name VARCHAR2(100),
  address_state VARCHAR2(10),
  email_address VARCHAR2(350),
  CONSTRAINT pk_cust PRIMARY KEY (customer_id)
);

CREATE TABLE customer_order (
  order_id NUMBER(5),
  customer_id NUMBER(5),
  product_id NUMBER(5),
  order_date DATE,
  CONSTRAINT pk_order PRIMARY KEY (order_id),
  CONSTRAINT fk_order_cust FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT fk_order_prod FOREIGN KEY (product_id) REFERENCES product(product_id)
);


/*
Sample data
*/

--Department
INSERT INTO department (department_id, department_name) VALUES (1, 'Executive');
INSERT INTO department (department_id, department_name) VALUES (2, 'Sales');
INSERT INTO department (department_id, department_name) VALUES (3, 'Customer Support');
INSERT INTO department (department_id, department_name) VALUES (4, 'Hardware Development');
INSERT INTO department (department_id, department_name) VALUES (5, 'Software Development');
INSERT INTO department (department_id, department_name) VALUES (6, 'Marketing');
INSERT INTO department (department_id, department_name) VALUES (7, 'Finance');
INSERT INTO department (department_id, department_name) VALUES (8, 'Legal');
INSERT INTO department (department_id, department_name) VALUES (9, 'Maintenance');



--Employee
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (1, 'Michelle', 'Foster', 48000, 8, 162, '27-08-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (2, 'Cheryl', 'Turner', 79000, 3, 99, '2-01-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (3, 'Carolyn', 'Hudson', 47000, 7, 199, '4-12-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (4, 'Patrick', 'Berry', 51000, 3, 159, '12-11-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (5, 'Doris', 'Powell', 117000, 1, NULL, '15-10-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (6, 'Jessica', 'Elliott', 21000, 7, 70, '2-07-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (7, 'Sean', 'Burns', 51000, 6, 37, '3-10-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (8, 'Ann', 'Bowman', 34000, 7, 187, '20-06-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (9, 'Kathleen', 'Jones', 92000, 7, 131, '15-03-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (10, 'Scott', 'Cruz', 32000, 8, 170, '3-06-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (11, 'Norma', 'Henry', 56000, 3, 8, '24-07-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (12, 'Evelyn', 'Gonzalez', 118000, 5, 177, '13-08-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (13, 'Stephen', 'Hudson', 63000, 4, 133, '22-12-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (14, 'Bruce', 'Mitchell', 71000, 5, 175, '17-08-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (15, 'Nicholas', 'Dixon', 24000, 5, 113, '9-02-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (16, 'Fred', 'Nichols', 70000, 3, 186, '7-03-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (17, 'Barbara', 'Morales', 65000, 6, 85, '1-07-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (18, 'Ralph', 'Anderson', 34000, 4, 73, '21-07-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (19, 'Lois', 'Butler', 81000, 6, 140, '2-11-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (20, 'Johnny', 'Adams', 103000, 6, 170, '20-10-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (21, 'George', 'Burton', 43000, 4, 67, '14-04-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (22, 'Dorothy', 'Cook', 21000, 5, 95, '3-01-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (23, 'Teresa', 'Bell', 56000, 6, 200, '29-04-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (24, 'Anthony', 'Rice', NULL, 4, 155, '3-01-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (25, 'Joseph', 'Berry', 87000, 8, 142, '7-01-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (26, 'Alice', 'Perry', 106000, 1, 5, '28-09-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (27, 'Ralph', 'Montgomery', 49000, 3, 14, '5-12-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (28, 'Roy', 'Lane', 40000, 3, 95, '13-11-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (29, 'Kenneth', 'Bennett', 82000, 3, 169, '28-04-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (30, 'Theresa', 'Lawson', 32000, 7, 170, '6-01-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (31, 'Jesse', 'Hanson', 92000, 2, 82, '24-11-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (32, 'Diana', 'Armstrong', 37000, 8, 145, '27-11-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (33, 'Donna', 'Martinez', 51000, 2, 108, '23-05-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (34, 'Phyllis', 'Larson', 29000, 4, 23, '30-11-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (35, 'Robert', 'Gilbert', 102000, 3, 38, '18-12-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (36, 'Teresa', 'Graham', 61000, 6, 8, '14-10-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (37, 'Jessica', 'Sullivan', 21000, 2, 61, '2-09-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (38, 'David', 'Bailey', 102000, 8, 106, '30-04-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (39, 'Fred', 'Wallace', 37000, 6, 117, '16-04-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (40, 'Jason', 'Alvarez', 32000, 8, 149, '19-02-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (41, 'Angela', 'Lewis', 65000, 2, 8, '27-07-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (42, 'Justin', 'Nelson', 50000, 8, 145, '9-04-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (43, 'Clarence', 'George', 85000, 5, 105, '10-03-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (44, 'Philip', 'Jordan', 43000, 7, 67, '21-08-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (45, 'Lori', 'Jacobs', 69000, 2, 114, '15-03-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (46, 'Jeremy', 'Porter', 99000, 6, 15, '19-06-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (47, 'Jessica', 'Bennett', 83000, 4, 145, '4-11-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (48, 'Ruth', 'Price', 27000, 8, 160, '4-05-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (49, 'Melissa', 'Cunningham', 67000, 2, 82, '3-06-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (50, 'Henry', 'Kennedy', 78000, 4, 60, '25-04-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (51, 'Martha', 'Cruz', 52000, 7, 85, '4-11-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (52, 'Lori', 'Rogers', 27000, 7, 37, '13-08-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (53, 'Cynthia', 'Medina', 118000, 2, 114, '16-06-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (54, 'Russell', 'Payne', 104000, 2, 127, '18-12-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (55, 'Sarah', 'Richardson', 80000, 8, 23, '2-12-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (56, 'Susan', 'Henderson', 31000, 4, 46, '20-12-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (57, 'Diana', 'Spencer', 83000, 3, 45, '9-03-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (58, 'Louise', 'Bryant', 48000, 5, 54, '11-04-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (59, 'Christine', 'Brooks', 40000, 6, 57, '6-06-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (60, 'Ruby', 'Shaw', 25000, 4, 74, '7-05-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (61, 'Karen', 'Williams', 87000, 3, 70, '25-01-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (62, 'Brandon', 'Campbell', 47000, 5, 115, '29-03-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (63, 'Antonio', 'Andrews', 55000, 8, 134, '20-05-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (64, 'Gloria', 'Greene', 81000, 4, 132, '20-05-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (65, 'Melissa', 'Stevens', 80000, 4, 105, '23-12-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (66, 'Evelyn', 'Bailey', 78000, 3, 25, '31-07-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (67, 'Clarence', 'Welch', 41000, 3, 173, '30-10-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (68, 'Doris', 'Graham', 82000, 1, 5, '3-05-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (69, 'Cynthia', 'Howell', 102000, 4, 68, '17-07-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (70, 'Susan', 'Harris', 78000, 2, 159, '4-04-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (71, 'Pamela', 'Allen', 87000, 6, 19, '27-11-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (72, 'Victor', 'Oliver', 36000, 5, 129, '4-01-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (73, 'Jennifer', 'Fisher', NULL, 8, 171, '14-02-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (74, 'Larry', 'Lawrence', 67000, 7, 101, '27-11-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (75, 'Janice', 'Morrison', 66000, 4, 12, '15-04-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (76, 'Billy', 'Shaw', 42000, 5, 69, '14-10-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (77, 'David', 'Thompson', 112000, 8, 151, '7-04-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (78, 'Cheryl', 'Castillo', 42000, 8, 161, '12-04-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (79, 'Sean', 'Ramirez', 67000, 2, 8, '21-10-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (80, 'Joseph', 'Davis', 30000, 8, 182, '12-10-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (81, 'Joyce', 'Diaz', 113000, 2, 111, '3-11-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (82, 'Ann', 'Hill', 91000, 5, 157, '8-06-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (83, 'Harold', 'Spencer', 104000, 5, 42, '19-11-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (84, 'Jennifer', 'Long', 36000, NULL, 4, '25-11-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (85, 'Johnny', 'Reed', 22000, 7, 60, '12-06-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (86, 'Randy', 'Riley', 85000, 6, 196, '2-05-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (87, 'Nancy', 'Fuller', 26000, 6, 7, '29-06-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (88, 'Barbara', 'Reynolds', 67000, 6, 102, '27-06-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (89, 'Irene', 'Cox', 108000, 7, 68, '24-01-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (90, 'Earl', 'Grant', 68000, 2, 157, '6-11-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (91, 'Christopher', 'Collins', 77000, 8, 16, '8-06-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (92, 'Ruby', 'Clark', 35000, 2, 114, '26-10-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (93, 'Evelyn', 'Campbell', 88000, 5, 129, '6-02-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (94, 'Lisa', 'Williams', 101000, 5, 111, '17-06-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (95, 'Stephanie', 'Williams', 26000, 3, 44, '31-01-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (96, 'Craig', 'Lewis', 43000, 7, 174, '30-07-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (97, 'Justin', 'Little', 112000, 2, 181, '4-06-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (98, 'James', 'Rodriguez', 70000, 6, 18, '28-02-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (99, 'Mark', 'Jackson', 68000, 6, 57, '5-02-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (100, 'Robert', 'Hicks', 111000, 8, 182, '1-08-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (101, 'Earl', 'Butler', 55000, 8, 68, '2-05-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (102, 'Ralph', 'Woods', 22000, 4, 10, '5-02-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (103, 'Larry', 'Parker', 78000, 6, 137, '22-11-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (104, 'Debra', 'Roberts', 83000, 2, 93, '1-07-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (105, 'Tammy', 'Peterson', 45000, 2, 131, '18-04-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (106, 'Bruce', 'Larson', 73000, 8, 181, '6-08-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (107, 'Shawn', 'Hunt', 105000, 3, 67, '3-09-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (108, 'Frank', 'Jones', 74000, 7, 93, '15-03-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (109, 'Paula', 'Dunn', 69000, 7, 175, '26-01-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (110, 'Janet', 'Watson', 90000, 7, 172, '8-12-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (111, 'Kenneth', 'Little', 29000, 8, 162, '12-06-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (112, 'Helen', 'Snyder', 63000, 3, 124, '18-01-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (113, 'Carolyn', 'Perkins', 99000, 2, 124, '13-03-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (114, 'James', 'Phillips', 87000, NULL, 88, '28-12-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (115, 'Clarence', 'Thomas', 25000, 3, 126, '1-06-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (116, 'John', 'Diaz', 75000, 2, 130, '25-05-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (117, 'Anna', 'Green', 61000, 3, 140, '2-02-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (118, 'Billy', 'Wagner', 46000, 3, 160, '12-09-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (119, 'Paula', 'Lynch', 73000, 5, 39, '27-11-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (120, 'Antonio', 'Banks', 77000, 6, 115, '26-06-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (121, 'Helen', 'Garza', 79000, 3, 120, '5-06-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (122, 'Dorothy', 'Duncan', 45000, 4, 100, '6-06-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (123, 'Louis', 'Elliott', 33000, 3, 51, '29-10-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (124, 'Andrea', 'Watson', 46000, 7, 26, '9-09-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (125, 'Mark', 'Rogers', 111000, 5, 72, '30-06-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (126, 'Christopher', 'Lawrence', 69000, 3, 187, '2-05-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (127, 'Todd', 'Larson', 106000, 2, 141, '28-04-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (128, 'Janice', 'Vasquez', 82000, 3, 102, '4-09-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (129, 'Kelly', 'Gonzalez', 40000, 5, 111, '21-04-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (130, 'Pamela', 'Medina', 107000, 5, 158, '22-01-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (131, 'Roy', 'Oliver', 63000, 7, 134, '9-03-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (132, 'Sandra', 'Mason', 112000, 5, 177, '28-03-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (133, 'Pamela', 'Collins', 113000, 5, 199, '29-10-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (134, 'Gary', 'Greene', 100000, 3, 25, '3-01-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (135, 'Deborah', 'Harrison', 77000, 7, 180, '24-07-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (136, 'Andrew', 'Mccoy', 113000, 6, 54, '20-04-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (137, 'Henry', 'Perez', 52000, 3, 38, '4-12-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (138, 'Matthew', 'Foster', 36000, 6, 19, '21-01-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (139, 'Kevin', 'Howell', 102000, 5, 121, '25-01-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (140, 'Rebecca', 'Chapman', 89000, NULL, 195, '9-01-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (141, 'Lawrence', 'Garrett', 89000, 7, 142, '12-04-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (142, 'Emily', 'Perry', 77000, 4, 194, '23-12-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (143, 'Earl', 'Simmons', 86000, 4, 32, '5-07-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (144, 'Shawn', 'Dixon', 120000, 8, 174, '6-07-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (145, 'Todd', 'Hawkins', 101000, 2, 60, '8-10-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (146, 'Marilyn', 'Russell', 27000, 5, 124, '25-12-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (147, 'Gregory', 'Bell', 68000, 3, 107, '11-03-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (148, 'Diana', 'Romero', 26000, 4, 62, '24-01-2017');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (149, 'Randy', 'Mitchell', 78000, 4, 183, '3-07-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (150, 'Heather', 'Diaz', 63000, 5, 192, '3-08-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (151, 'Kathleen', 'Arnold', 118000, 3, 85, '15-08-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (152, 'Tina', 'Sims', 32000, 4, 8, '15-10-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (153, 'Sara', 'Grant', 100000, 5, 140, '30-11-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (154, 'Brandon', 'Baker', 53000, 7, 66, '23-06-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (155, 'Timothy', 'Morgan', 118000, 2, 197, '31-07-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (156, 'Jack', 'Franklin', 78000, 5, 25, '15-01-2017');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (157, 'Carlos', 'Russell', 34000, 2, 3, '15-07-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (158, 'Donna', 'Andrews', 99000, 5, 185, '11-05-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (159, 'Gary', 'Knight', 81000, 5, 16, '12-09-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (160, 'Lawrence', 'Collins', 103000, 3, 61, '16-11-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (161, 'Randy', 'Ward', 77000, 2, 119, '16-01-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (162, 'Kimberly', 'Mendoza', 27000, 3, 191, '26-06-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (163, 'Jacqueline', 'Peters', 27000, 4, 10, '17-05-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (164, 'Betty', 'Gutierrez', 23000, 8, 148, '2-11-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (165, 'Fred', 'Webb', 71000, 2, 152, '27-12-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (166, 'Wanda', 'Garza', 95000, 6, 11, '24-11-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (167, 'Norma', 'Wagner', 87000, 6, 84, '18-03-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (168, 'Amy', 'Wheeler', 31000, 7, 35, '28-07-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (169, 'Todd', 'Patterson', 72000, 8, 56, '15-06-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (170, 'Barbara', 'Stone', 108000, 3, 174, '29-06-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (171, 'Carolyn', 'Owens', 68000, 8, 27, '6-12-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (172, 'Ann', 'Romero', 71000, 7, 31, '21-06-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (173, 'John', 'Hayes', 85000, 8, 18, '23-03-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (174, 'Judith', 'Richardson', 80000, 2, 57, '2-01-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (175, 'Shawn', 'Sanders', 27000, 7, 68, '20-03-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (176, 'Margaret', 'Wagner', 85000, 4, 64, '19-07-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (177, 'Craig', 'Diaz', 114000, 5, 194, '24-12-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (178, 'Justin', 'Fowler', 53000, 2, 191, '25-07-2013');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (179, 'Christina', 'Berry', 94000, 2, 181, '9-05-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (180, 'Daniel', 'Stevens', 50000, 4, 34, '15-05-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (181, 'Marie', 'Hanson', 84000, 5, 56, '4-01-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (182, 'Bobby', 'Gonzalez', 71000, 6, 72, '21-10-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (183, 'Nicole', 'Robinson', 66000, 3, 110, '7-01-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (184, 'Jerry', 'Ward', 33000, 7, 69, '30-01-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (185, 'Kathy', 'Sanders', 114000, 7, 181, '26-02-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (186, 'Pamela', 'Henderson', 120000, 3, 87, '18-08-2016');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (187, 'Chris', 'Boyd', 23000, 8, 37, '16-07-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (188, 'Barbara', 'Green', 46000, 2, 153, '26-07-2014');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (189, 'Adam', 'Stephens', 99000, 7, 82, '23-07-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (190, 'Anne', 'King', 120000, 5, 28, '12-02-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (191, 'Randy', 'Spencer', 80000, 5, 193, '6-01-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (192, 'Wanda', 'Stewart', 28000, 7, 184, '27-05-2011');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (193, 'Ashley', 'Cox', 41000, 5, 137, '7-10-2010');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (194, 'Carl', 'Baker', 64000, 6, 149, '28-07-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (195, 'Tina', 'Arnold', 77000, 6, 41, '26-01-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (196, 'Julia', 'Rogers', 35000, 7, 18, '19-12-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (197, 'Larry', 'Knight', 90000, 8, 48, '26-06-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (198, 'Ashley', 'Griffin', 64000, 3, 40, '15-01-2015');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (199, 'Lawrence', 'Henderson', 39000, 6, 47, '9-05-2012');
INSERT INTO employee (employee_id, first_name, last_name, salary, department_id, manager_id, hire_date) VALUES (200, 'Charles', 'Stone', 70000, 5, 153, '16-08-2015');




--Product
INSERT INTO product (product_id, product_name, price, department_id) VALUES (1, 'Monitor', 149.95, 4);
INSERT INTO product (product_id, product_name, price, department_id) VALUES (2, 'Desk', 110.9, 4);
INSERT INTO product (product_id, product_name, price, department_id) VALUES (3, 'Chair', 79.95, 4);
INSERT INTO product (product_id, product_name, price, department_id) VALUES (4, 'Accounting Plus', 60.45, 5);
INSERT INTO product (product_id, product_name, price, department_id) VALUES (5, 'Microsoft Office', 121.15, 5);
INSERT INTO product (product_id, product_name, price, department_id) VALUES (6, 'Antivirus Extreme', 48.5, 5);
INSERT INTO product (product_id, product_name, price, department_id) VALUES (7, 'Photo Editing Pro', 250, 5);
INSERT INTO product (product_id, product_name, price, department_id) VALUES (8, 'Web Tools 4', 202.5, 5);



--Customer
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (1, 'Teresa', 'Hudson', 'NY', 'thudson@abc.com');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (2, 'Fred', 'Montgomery', 'CA', 'fmont@gmail.com');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (3, 'Lois', 'Lawson', 'OR', 'lois_law@outlook.com');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (4, 'Alice', 'Perry', 'SC', 'aliceperry');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (5, 'Ralph', 'Montgomery', 'TX', 'ralph_mont25@gmail.com');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (6, 'Dorothy', 'Armstrong', 'OR', 'abc123@abc.com');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (7, 'Fred', 'Wallace', 'NY', 'wallacef@testwebsite.co.uk');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (8, 'Joseph', 'Bell', 'FL', 'jbell@comm.edu');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (9, 'Lois', 'Martinez', 'CALIF', 'loismar@awe.com');
INSERT INTO customer (customer_id, first_name, last_name, address_state, email_address) VALUES (10, 'Robert', 'Rice', 'IN', 'robrice123');



--Customer Order
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (1, 3, 2, '18-12-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (2, 5, 6, '1-06-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (3, 6, 5, '26-09-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (4, 9, 1, '8-09-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (5, 7, 2, '13-04-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (6, 5, 7, '4-02-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (7, 9, 7, '11-04-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (8, 6, 8, '27-06-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (9, 2, 7, '23-01-2017');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (10, 8, 7, '7-11-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (11, 2, 2, '9-06-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (12, 9, 7, '4-01-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (13, 5, 5, '22-04-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (14, 9, 2, '14-09-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (15, 7, 1, '7-12-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (16, 5, 4, '17-10-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (17, 9, 6, '14-03-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (18, 9, 4, '9-07-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (19, 6, 2, '6-05-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (20, 3, 5, '10-07-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (21, 9, 5, '13-04-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (22, 6, 7, '18-01-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (23, 7, 8, '1-08-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (24, 6, 2, '21-01-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (25, 6, 5, '12-04-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (26, 8, 5, '7-09-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (27, 5, 1, '25-04-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (28, 7, 5, '30-08-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (29, 5, 3, '27-08-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (30, 8, 3, '14-04-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (31, 3, 3, '24-05-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (32, 7, 4, '4-05-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (33, 2, 1, '28-10-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (34, 8, 5, '4-04-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (35, 5, 4, '12-10-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (36, 5, 4, '26-11-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (37, 6, 7, '31-12-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (38, 7, 6, '22-11-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (39, 6, 3, '8-02-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (40, 10, 4, '16-01-2017');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (41, 9, 4, '5-04-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (42, 6, 1, '8-02-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (43, 8, 6, '30-09-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (44, 6, 2, '17-11-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (45, 6, 5, '5-01-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (46, 2, 3, '30-01-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (47, 3, 4, '15-12-2015');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (48, 9, 3, '21-01-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (49, 5, 1, '20-07-2016');
INSERT INTO customer_order (order_id, customer_id, product_id, order_date) VALUES (50, 7, 3, '14-01-2016');

COMMIT;

/*
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM customer_order;
*/



