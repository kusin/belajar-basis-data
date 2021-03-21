-- crud tb_employee
select * from tb_employee;
select * from tb_departement;
select * from tb_dept_location;
select * from tb_dependent;
select * from tb_project;
select * from tb_work_on;

----------------------------------------------------------------------------------------------------
-- # tb_employee  # ================================================================================
----------------------------------------------------------------------------------------------------
-- menambah data
insert into
	tb_employee (SSN, FName, MName, LName, BDate, Address, Sex, Salary, SuperSSN, DNumber)
values
	('E001', 'Hakim', null, 'Arifin', '12-Jan-1987', 'BATENG', 'M', 4000000, null, 1),
	('E002', 'Yuni', null, 'Arti', '15-Feb-1987', 'BARA', 'F', 4000000, null, 2),
	('E003', 'Mutia', null, 'Aziza', '23-Mar-1987', 'BATENG', 'F', 4000000, null, 3),
	('E004', 'Hanif', null, 'Affandi', '21-Jan-1987', 'BARA', 'M', 4000000, null, 4),
	('E005', 'Vera', null, 'Yunita', '16-May-1987', 'BALEBAK', 'F', 3500000, 'E001', 1),
	('E006', 'Pritasri', null, 'Palupiningsih', '09-Dec-1987', 'BADONENG', 'F', 3500000, 'E001', 1),
	('E007', 'Rifki', 'Y', 'Haidar', '02-Aug-1987', 'BATENG', 'M', 3000000, 'E001', 1),
	('E008', 'Muhammad', 'A', 'Rosyidi', '22-Jun-1987', 'PERUMDOS', 'M', 2750000, 'E001', 1),
	('E009', 'Ferry', null, 'Pratama', '11-Jul-1987', 'BARA', 'M', 3000000, 'E002', 2),
	('E010', 'Andi', null, 'Sasmita', '15-Feb-1987', 'BATENG', 'M', 3000000, 'E002', 2),
	('E011', 'Yuhan', 'A', 'Kusuma', '16-Mar-1987', 'BARA', 'M', 2500000, 'E002', 2),
	('E012', 'Ferdian', null, 'Feisal', '23-Mar-1987', 'BATENG', 'M', 2000000, 'E002', 2),
	('E013', 'Albertus', 'A', 'M', '22-May-1986', 'BARA', 'M', 3000000, 'E003', 3),
	('E014', 'Benedika', 'F', 'Hutabarat', '21-Jun-1987', 'BADONENG', 'M', 3250000, 'E003', 3),
	('E015', 'Herbet', null, 'Sianipar', '16-Jul-1987', 'BARA', 'M', 3750000, 'E003', 3);

-- melihat data
select * from tb_employee;


----------------------------------------------------------------------------------------------------
-- # tb_departement # ==============================================================================
----------------------------------------------------------------------------------------------------
-- menambah data
insert into
	tb_departement (DNumber, DName, Mgr_SSN, Mgr_StartDate)
values
	(1,'HRD','E001','09-Jan-2002'),
	(2,'FINANCE','E002','27-Feb-2003'),
	(3,'HUMAS','E003','30-May-2006'),
	(4,'PRODUKSI','E004','08-Mar-2005');

-- melihat data
select * from tb_departement;


----------------------------------------------------------------------------------------------------
-- # tb_departement # ==============================================================================
----------------------------------------------------------------------------------------------------
INSERT INTO Dept_Locations VALUES(1,'Darmaga');INSERT INTO Dept_Locations VALUES(3,'Darmaga');INSERT INTO Dept_Locations VALUES(2,'Darmaga');INSERT INTO Dept_Locations VALUES(4,'Baranang Siang');