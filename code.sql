create database if not exists proyecto;
use proyecto;
set global local_infile = True;


create table if not exists `course` (
	id int primary key,
	subject_id int not null,
	nr int,
	spec tinyint,
	hours int
);
load data local infile 'gen/out/course.csv' into table `course` fields terminated by ';' ignore 1 lines;


create table if not exists `course_req` (
	id int primary key,
	course_id int not null,
	required_id int not null
);
load data local infile 'gen/out/course_req.csv' into table `course_req` fields terminated by ';' ignore 1 lines;


create table if not exists `group` (
	id int primary key,
	teacher_id int not null,
	name varchar(2),
	start_year int
);
load data local infile 'gen/out/group.csv' into table `group` fields terminated by ';' ignore 1 lines;


create table if not exists `major_arche` (
	id int primary key,
	name varchar(28),
	subject_id int not null,
	courses_req int
);
load data local infile 'gen/out/major_arche.csv' into table `major_arche` fields terminated by ';' ignore 1 lines;


create table if not exists `major_req` (
	id int primary key,
	arche_id int not null,
	course_id int not null
);
load data local infile 'gen/out/major_req.csv' into table `major_req` fields terminated by ';' ignore 1 lines;


create table if not exists `parent` (
	id int primary key,
	user_id int not null
);
load data local infile 'gen/out/parent.csv' into table `parent` fields terminated by ';' ignore 1 lines;


create table if not exists `parenthood` (
	id int primary key,
	parent_id int not null,
	student_id int not null
);
load data local infile 'gen/out/parenthood.csv' into table `parenthood` fields terminated by ';' ignore 1 lines;


create table if not exists `student` (
	id int primary key,
	user_id int not null,
	group_id int not null
);
load data local infile 'gen/out/student.csv' into table `student` fields terminated by ';' ignore 1 lines;


create table if not exists `subject` (
	id int primary key,
	name varchar(22),
	name_short varchar(7)
);
load data local infile 'gen/out/subject.csv' into table `subject` fields terminated by ';' ignore 1 lines;


create table if not exists `teacher` (
	id int primary key,
	user_id int not null,
	title varchar(7),
	is_head tinyint
);
load data local infile 'gen/out/teacher.csv' into table `teacher` fields terminated by ';' ignore 1 lines;


create table if not exists `user` (
	id int primary key,
	name varchar(10),
	last_name varchar(11),
	email varchar(30),
	phone_number int,
	login varchar(14),
	password varchar(21)
);
load data local infile 'gen/out/user.csv' into table `user` fields terminated by ';' ignore 1 lines;

