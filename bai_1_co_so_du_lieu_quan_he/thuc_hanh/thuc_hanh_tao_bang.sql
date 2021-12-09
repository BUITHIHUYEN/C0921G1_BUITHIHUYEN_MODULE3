CREATE SCHEMA student_management;
CREATE TABLE `student_management`.`student`(
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);
CREATE TABLE `student_management`.`class`(
id int primary key,
`name` varchar(50)
);
CREATE TABLE `student_management`.`teacher`(
id int primary key,
`name` varchar(50),
age int,
country varchar(50)
);