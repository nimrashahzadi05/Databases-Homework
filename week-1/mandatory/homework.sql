--DROP TABLE
drop table if exists class_attendence;
drop table if exists classes;
drop table if exists mentors;
drop table if exists students;



--TABLE MENTORS
create table if not exists mentors (
id                 SERIAL primary key,
name               VARCHAR(60)not null,
stay_in_Glassgow   smallint not null,
address            VARCHAR(120)not null,
fav_prog_lang      VARCHAR(20)
);
insert into  mentors (name, stay_in_Glassgow, address, fav_prog_lang) VALUES
('Ali', '4', 'London', 'JS'),
('Musa', '4', 'Birmingham', 'JS'),
('Hamza', '4', 'Ilford', 'HTML'),
('Asad', '4', 'Bradford', 'CSS'),
('Muazam', '4', 'Barcelona', 'JS');

--TABLE STUDENTS
create table if not exists students(
id                SERIAL primary key,
name              VARCHAR(60),
address           VARCHAR(120)not null,
graduated         BOOLEAN not null
);
insert into students (name, address, graduated) values 
('Ali', 'London', True),
('Hamza', 'London', False),
('Asad', 'Barcelona', True),
('Muazam', 'London', False),
('Musa', 'Bradford', True),
('Hanna', 'London', False),
('Yun', 'London', True),
('Nuno', 'Barcelona', True),
('Amanda', 'London', False),
('Manpreet', 'Madrid', True);

--TABLE classes
create table if not exists classes (
id           SERIAL primary key,
mentor_id    INT references mentors(id),
topic        VARCHAR(60),
taught_date  DATE not null,
address      VARCHAR(120)not null
);
insert into classes (mentor_id, taught_date, topic, address) values 
(1, '2022/12/17', 'JS', 'London');


--TABLE CLASS_ATTENDENCE
create table if not exists class_attendence  (
id   SERIAL primary key,
students_id  INT references students(id),
class_id    INT references classes(id)
);
insert into class_attendence (students_id, class_id) values (2,1);

--select comand
select * from students limit 5;
select * from mentors;
select * from students where graduated = true limit 3;
select * from classes;
--join students table with class_attendence table
select s.name from class_attendence as ca 
join students as s 
on ca.students_id = s.id 
limit 5;
--join classes and student table with class_attendence table
select s.name from students as s 
join class_attendence as ca 
on s.id = ca.students_id
join classes as c 
on c.id = ca.class_id
where c.taught_date = '2022/12/17';
--all students who attended JS class
select * from mentors as m
where stay_in_glassgow > 5;
select * from mentors as m
where m.fav_prog_lang  ='JS';