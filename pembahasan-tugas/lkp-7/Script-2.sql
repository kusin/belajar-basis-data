-- nomor 1A
select A.ssn, A.fname, A.lname, B.dname, D.pname 
	from tb_employee A, tb_departement B, tb_work_on C, tb_project D
		where A.ssn = B.mgr_ssn and A.ssn = C.ssn and C.pnumber = D.pnumber;
	
-- nomor 1B
-- cara 1 (join ansi 92)
select A.ssn, A.fname, A.lname, C.dependentname, C.relationship from (
	select B.ssn, count(B.pnumber) from tb_work_on B group by B.ssn having count(B.pnumber) = 1
) t join tb_employee A On A.ssn=t.ssn LEFT OUTER join tb_dependent C On t.ssn=C.ssn;

-- cara 2 (view ansi 89)
select A.ssn, A.fname, A.lname, B.dependentname, B.relationship 
	from tb_employee A, tb_dependent B, tb_work_on C, tb_project D
	where A.ssn = B.ssn and A.ssn = C.ssn and C.pnumber = D.pnumber
	group by A.ssn, A.fname, A.lname, B.dependentname, B.relationship having count(C.pnumber) = 1;

-- nomor 2A
create view vw_departement as
	select A.dnumber, A.dname from tb_departement A order by dnumber;
	
select * from vw_departement;

-- nomor 2B
select A.ssn, concat(A.fname,' ',A.lname) as Employee_name, B.dname, sum(C.hours) as hours
	from tb_employee A, tb_departement B, tb_work_on C
	where A.dnumber = B.dnumber and A.ssn = C.ssn
	group by A.ssn, B.dname having sum(C.hours) > 120 order by ssn;

-- nomor 3A
-- cara view
select B.dname, count(A.ssn) as sum_employee
	from tb_employee A, tb_departement B
		where A.dnumber = B.dnumber
			group by B.dname order by B.dname;
-- cara join
select B.dname, count(A.ssn) as sum_employee
	from tb_employee A
		inner join tb_departement B on A.dnumber = B.dnumber
		group by B.dname order by B.dname;


--drop function public.sp_employee;
create function sp_employee() returns trigger as $tester$
	--returns table (dname varchar, ssn bigint) as $$
	begin 
		--return query
		select B.dname, count(A.ssn) as sum_employee
			from tb_employee A
				inner join tb_departement B on A.dnumber = B.dnumber
				group by B.dname order by B.dname;
		--return null;
		RETURN(SELECT dblink_disconnect());
	end $tester$ language plpgsql;
		
--drop trigger tr_employee on tb_employee;
create trigger tr_employee
	after delete on tb_employee for each row
	execute procedure sp_employee();

-- select * from tb_employee;
delete from tb_employee where ssn = 'E009';



































