create database Hospital; 
use Hospital;

create table Patients
(P_id int (10) not null, 
Fname varchar(10) not null, 
Surname varchar(10) not null, 
Ssn int (10) not null, 
Address varchar(10), 
Sex char(1), 
Bdate date, 
phone int (10) not null, 
RoomNo int (10),
Primary key (P_id),
Foreign key (RoomNo) references Room(RoomNo));

INSERT into Patients ( P_id , Fname , Surname , Ssn , Address , Sex ,Bdate ,phone ,RoomNo )values 
(01,'Khaled','Ahmad',1109023332,'Taif21933','M','1997-03-11', 0509055432 ,10); 
INSERT into Patients ( P_id , Fname , Surname , Ssn , Address , Sex ,Bdate ,phone ,RoomNo )values 
(02,'Omar','Ali',1190678999,'Taif36511','M', '1990-12-09' , 0594437690 ,20 ); 
INSERT into Patients ( P_id , Fname , Surname , Ssn , Address , Sex ,Bdate ,phone ,RoomNo )values 
(03 ,'Amal','Fahad', 1010870003 ,'Taif51434','F', '1983-10-04' , 0558964322 ,30 ); 
INSERT into Patients ( P_id , Fname , Surname , Ssn , Address , Sex ,Bdate ,phone ,RoomNo )values 
(04 ,'Sara','Naser', 1102037890 ,'Taif44220','F', '2000-08-19' , 0500034578 , NULL );

create table Doctors 
(D_id int (10) not null,
Fname varchar(10) not null, 
Surname varchar(10) not null, 
Ssn int(10) not null, 
DepNo int(10), 
Office_phone int(10),   
Address varchar(15), 
Bdate date,
primary key (D_id),
foreign key (DepNo) references Department(DepNo));

INSERT into Doctors (D_id, Fname, Surname , Ssn ,DepNo , Office_phone, Address, Bdate)values 
(40 ,'Saleh','Saeed', 1090234445 , 99 , 0177251225 ,'Jeddah21452','1980-12-03'); 
INSERT into Doctors (D_id, Fname, Surname , Ssn ,DepNo , Office_phone, Address, Bdate)values 
(44 ,'Ibrahem','Mohamed',1100237990 , 98 , 0177251228 ,'Taif28880','1977-07-11'); 
INSERT into Doctors (D_id, Fname, Surname , Ssn ,DepNo , Office_phone, Address, Bdate)values 
(48 ,'Mona','Salman', 1122998753 , 97 , 0176654330 ,'Taif19987','1979-11-22');

create table Appointment
(A_id int(10) not null,
P_id int(10) not null, 
Date_time datetime, 
Status char,
primary key (A_id),
foreign key (P_id) references Patients(P_id));

INSERT into Appointment (A_id,P_id,Date_time,status)values 
( 11 , 04 ,'2020-11-22 14:00:00','G'); 
INSERT into Appointment (A_id,P_id,Date_time,status)values 
(12 ,02 ,'2020-11-22 14:00:00','G'); 
INSERT into Appointment ( A_id,P_id,Date_time,status)values 
(13 ,01 ,'2020-11-23 13:00:00','G'); 
INSERT into Appointment ( A_id,P_id,Date_time,status)values 
(14 , 03 ,'2020-11-23 14:00:00','G');

Create table Department 
(D_id int(10) not null,
DepNo int(10) not null,
Dep_name varchar (20),
primary key (DepNo),
foreign key (D_id) references Doctors(D_id));

INSERT INTO Department (D_id ,DepNo, Dep_name)values
(40 , 99 ,'Radiology'); 
INSERT INTO Department (D_id ,DepNo ,Dep_name)values 
(44 , 98 ,'ENT'); 
INSERT INTO Department (D_id ,DepNo, Dep_name)values 
(48 , 97 ,'Dermatology');

Create table Medication 
(Med_id int (10) not null,
Name varchar (15) not null, 
Brand varchar (15), 
Description varchar (30), 
P_id int (10),
primary key (Med_id),
foreign key (P_id) references Patients(P_id));

INSERT into Medication (Med_id, Name, Brand , Description , P_id )values 
(111 ,'ProcrastinX','Snafu', NULL , 01); 
INSERT into Medication (Med_id, Name, Brand , Description , P_id )values 
(222 ,'Thesisin','Foo Labs', NULL , 02); 
INSERT into Medication (Med_id, Name, Brand , Description , P_id )values 
(333 ,'Awakin','Bar Laborato', NULL , 03); 
INSERT into Medication (Med_id, Name, Brand , Description , P_id )values 
(444 ,'Crescavitin','Baz Industr', NULL , 04);

Create table Room
(RoomNo int (10) not null, 
Room_Type varchar(10),
Floor int(1),
P_id int(10) not null,
primary key (RoomNo),
foreign key (P_id) references Patients(P_id));

INSERT into Room(RoomNo , Room_Type , Floor,P_id)values 
(10,'Single',1,01);
INSERT into Room (RoomNo,Room_Type, Floor,P_id)values 
(20,'Single',1,02);
INSERT into Room (RoomNo,Room_Type, Floor,P_id)values 
(30,'multiple',2,03);

-- //Querise .. comment
show tables;
select * from Patients;
select * from Doctors;
select * from Appointment;
select * from Department;
select * from Medication;
select * from Room;

select * from Department where DepNo = 98 ;
select * from Medication where Brand ='Foo Labs';
select * from Room where Room_Type = 'multiple';

select count(*) from Doctors;
select count(*) from Department;

create view doctors_name as select Fname from Doctors order by Fname ASC;
select * from doctors_name;

create view PatientsMaxMin as select  MIN(P_id), MAX(P_id) from Patients;
select * from PatientsMaxMin;
