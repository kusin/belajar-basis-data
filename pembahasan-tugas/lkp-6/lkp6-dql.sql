select * from tb_dept_location;
select * from tb_departement;

select * from tb_employee order by fname;
select * from tb_work_on;
select * from tb_project;
select * from tb_dependent;

----------------------------------------------------------------------------------------------------
-- # Latihan Soal  # ===============================================================================
----------------------------------------------------------------------------------------------------

-- melihat employee yang memiliki FName diawali huruf H
select SSN, FName, LName, BDate
	from tb_employee
		where FName like 'H%';

-- mengelompokan employee berdasarkan salary (Jika > 3.500.000 maka level top; sisanya level middle)
select SSN, FName, Salary,
	case
		when salary > 3500000 then 'Top' else 'Middle'
	end as level
from tb_employee order by SSN;

-- menentukan salary terbesar, terkecil, rata-rata dari employee
select max(salary), min(salary), avg(salary) from tb_employee;

-- menghitung berapa banyak employee yang beralamat di bara
select count(ssn) as Jumlah_Employee
	from tb_employee where address='BARA';

-- menentukan jumlah lokasi projek (tanpa pengulangan dan dengan pengulangan)
select count (distinct PLocation) as "Lokasi tanpa pengulangan", count(PLocation) as "Lokasi dengan pengulangan"
	from tb_project;
	
-- menentukan salary terkecil, salary terbesar, dan salary rata-rata dari setiap departemen diurutkan berdasarkan
select DNumber, Min(Salary), Max(Salary), Avg(Salary)
	from tb_employee group by Dnumber order by DNumber desc;
	
-- menentukan address yang memiliki lebih empat org employee
select address, count(*) from tb_employee
	group by address having count(*) > 4
	order by address;

-- menentukan usia employee
select SSN, FName, Age(current_date, BDate) as Age
	from tb_employee order by Age asc;

----------------------------------------------------------------------------------------------------
-- # Jawaban LKP-6 # ===============================================================================
----------------------------------------------------------------------------------------------------
select * from tb_employee order by fname;
select * from tb_dependent;
-- Nomor a.
select A.Fname, B.DependentName, B.relationship
	from tb_employee as A, tb_dependent as B
	where A.ssn = B.ssn and A.FName like 'R%';


-- Nomor b.
select * from tb_work_on order by pnumber asc;
select count(ssn) as sum_employee
	from tb_work_on where pnumber = '1';

-- Nomor c.
select count(ssn) as sum_employee 
	from tb_employee where salary > 3500000;

-- Nomor d.
select count(C.PNumber) as sum_employee
	from tb_departement A, tb_employee B, tb_work_on C
	where A.dnumber = B.dnumber and B.ssn = C.ssn and A.dnumber = '2';

-- nomor e.
select dnumber, sum(salary) as "sum of salary", avg(salary) as "average of salary" from tb_employee group by dnumber order by dnumber;

-- nomor f.
select dnumber, count(ssn) as "sum of employee"
	from tb_employee group by dnumber order by "sum of employee" desc;

-- nomor g.
select pnumber, sum(hours) as "Sum of hours"from tb_work_on
	group by pnumber order by pnumber;

-- nomor h.
select ssn, sum(hours) as "Sum of hours" from tb_work_on
	group by ssn having sum(hours) > 140;

-- nomor i.
select distinct ssn, sum(hours),
	case
		when sum(hours) >= 200 then '50%'
		when sum(hours) >= 150 then '25%'
		else '10%'
	end as bonus
from tb_work_on group by ssn order by ssn;

-- nomor j;
select ssn, count(pnumber) as "Sum of project"
	from tb_work_on group by ssn order by "Sum of project" desc;
	
-- nomor k
select ssn, count(pnumber) as "Sum of porject"
	from tb_work_on group by ssn having count(pnumber) >= 4;

-- nomor l
select ssn, sum(hours) as "Sum of hours", count(pnumber) as "Sum of project" 
	from tb_work_on group by ssn having count(pnumber) = 2 order by ssn;

-- nomor m
select relationship, count(*)
	from tb_dependent group by relationship;

-- nomor n
select dnumber, dname, mgr_ssn, age (mgr_startdate) as "long of working"
	from tb_departement;

-- nomor o
select distinct plocation, count(plocation) as "Sum of location project"
	from tb_project group by plocation having count(plocation) > 1;
