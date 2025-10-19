create database university;
use university;

create table students (
student_name int primary key,
student_id varchar(100),
email varchar(100),
course_name varchar(100),
gender enum ("M","F"),
cgpa decimal(10,2),
course_id int
);

insert into
students (student_id,student_name,email,course_name,gender,cgpa,course_id)
values
(1,'gayathri','gayu45@gmail.com','computer science',"F",8.5,101)
(2,'kavya',null,'MBA',"F",8.7,102)
(3,'elamgovan','elango10@gmail.com','EEE',"M",9.4,103)
(4,'karthi','karthi17@gmail.com','MSc',"M",9.6,104)
(5,'gowtham',null,'BSC',"M",9.4,105)

select distinct course_name
from students;

select distinct course_name
from students
where course_id=103;

select student_id,student_name
from students
where email is null;

select student_id,student_name
from students
where course_id in(101,104);

select student_id,student_name,cgpa
from students
where cgpa between 9.0 and 9.7;

select student_id,student_name,cgpa
from student
where cgpa not between 9.0 and 9.7;
