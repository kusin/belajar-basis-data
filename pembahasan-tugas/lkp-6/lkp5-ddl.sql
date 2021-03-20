-- membuat database
create database db_lkp5;

-- membuat tb_employee
create table tb_employee(
	ssn varchar(50),
	f_name varchar(50),
	m_name varchar(50),
	l_name varchar(50),
	b_date date,
	address varchar(50),
	sex varchar(50),
	salary bigint,
	super_ssn varchar(50),
	d_number int
);


-- membuat tb_departement
-- drop table tb_departement;
create table tb_departement(
	dnumber int,
	dname varchar(50),
	mgr_ssn varchar(50),
	mgr_start_date date
);

alter table tb_departement
	add constraint Dept_DNumber primary key (d_number);
alter table tb_departement
	add constraint ck_dname unique (d_name)


