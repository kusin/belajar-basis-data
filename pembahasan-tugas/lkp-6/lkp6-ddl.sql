-- membuat database
create database db_praktikum6;

-- membuat tb_employee
-- drop table tb_employee;
create table tb_employee(
	SSN varchar(50),
	FName varchar(50),
	MName varchar(50),
	LName varchar(50),
	BDate date,
	Address varchar(50),
	Sex varchar(50),
	Salary bigint,
	SuperSSN varchar(50),
	DNumber varchar(50)
);

alter table tb_employee add constraint ssn_pk primary key (ssn);
alter table tb_employee add constraint superssn_fk foreign key (superSSN) references tb_employee(ssn);
alter table tb_employee add constraint dnumber_fk foreign key (dnumber) references tb_departement(dnumber);

-- membuat tb_departement
-- drop table tb_departement;
create table tb_departement(
	DNumber varchar(50),
	DName varchar(50),
	Mgr_SSN varchar(50),
	Mgr_StartDate date
);

alter table tb_departement add constraint dnumber_pk primary key (dnumber);

-- membuat tb_dept_location;
-- drop table tb_dept_location;
create table tb_dept_location(
	DNumber varchar(50),
	DLocation varchar(50)
);

-- membuat tb_project;
-- drop table tb_project;
create table tb_project(
	PNumber varchar(50),
	PName varchar(50),
	PLocation varchar(50),
	DNumber varchar(50)
);

-- membuat tb_work_on;
-- drop table tb_work_on;
create table tb_work_on(
	SSN varchar(50),
	PNumber varchar(50),
	Hours bigint
);

-- membuat tb_dependent;
-- drop table tb_dependent;
create table tb_dependent(
	SSN varchar(50),
	DependentName varchar(50),
	Sex varchar(50),
	BDate date,
	Relationship varchar(50)
);


















