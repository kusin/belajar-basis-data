select * from tb_departement;
select * from tb_dept_location;

select * from tb_employee;
select * from tb_work_on;
select * from tb_project;


-- melihat daftar employee berdasarkan nama departemen
select A.ssn, A.fname, A.lname, B.dname
	from tb_employee A, tb_departement B
	where A.dnumber = B.dnumber order by ssn;
	
-- Menampilkan employee yang pernah bekerja pada projek yang dikelola oleh departemen tempat employee tersebut bekerja
select A.ssn, A.fname, A.lname, C.pname, D.dname
	from tb_employee A, tb_work_on B, tb_project C, tb_departement D
	where 

select A.ssn, A.fname, A.lname, C.pname
	from tb_employee A, tb_work_on B, tb_project C, tb_departement D
		where D.mgr_ssn = A.ssn and A.ssn = B.ssn and B.pnumber = C.pnumber;
		
		
		
		
		where A.ssn = B.ssn and A.dnumber = D.dnumber and B.pnumber = C.pnumber; 
		