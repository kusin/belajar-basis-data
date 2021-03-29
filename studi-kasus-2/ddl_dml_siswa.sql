-- membuat database
create database db_siswa;

-----------------------------------------------------------------
-- DDL DML tb_tahun_ajar ---------------------------------------------
-----------------------------------------------------------------
-- membuat table tb_tahun_ajar
create table tb_tahun_ajar(
	id_tahun_ajar serial,
	nama_tahun_ajar varchar(50),
	status_tahun_ajar varchar(50)
);

-- membuat primary key
alter table tb_tahun_ajar add primary key(id_tahun_ajar);

select * from tb_tahun_ajar;
insert into tb_tahun_ajar (nama_tahun_ajar, status_tahun_ajar)
	values ('2020/2021', 'Aktif'), ('2021/2022', 'Tidak Aktif'), ('2022/2023', 'Tidak Aktif');
-- Note:
-- 	ID Tahun Ajar menggunakan tipe data "SERIAL" sehingga tidak perlu ditulis saat menulis INSERT INTO.

-----------------------------------------------------------------
-- DDL DML tb_kelas ---------------------------------------------
-----------------------------------------------------------------

-- membuat tabel kelas 
-- drop table tb_kelas;
create table tb_kelas(
	id_kelas serial,
	jenjang_kelas varchar(50),
	nama_kelas varchar(50),
	status_kelas varchar(50)
);

-- membuat primary key
alter table tb_kelas add primary key (id_kelas);


select * from tb_kelas order by id_kelas;

insert into tb_kelas (jenjang_kelas, nama_kelas, status_kelas)
	values
		('X','X-1','Aktif'), ('X','X-2','Aktif'), ('X','X-3','Aktif'), ('X','X-4','Aktif'), ('X','X-5','Aktif'),
		('X','X-6','Aktif'), ('X','X-7','Aktif'), ('X','X-8','Aktif'), ('X','X-9','Aktif'), ('X','X-10','Aktif');

insert into tb_kelas (jenjang_kelas, nama_kelas, status_kelas)
	values
		('XI','XI-IPA-1','Aktif'), ('XI','XI-IPA-2','Aktif'), ('XI','XI-IPA-3','Aktif'), ('XI','XI-IPA-4','Aktif'), ('XI','XI-IPA-5','Aktif'),
		('XI','XI-IPS-1','Aktif'), ('XI','XI-IPS-2','Aktif'), ('XI','XI-IPS-3','Aktif'), ('XI','XI-IPS-4','Aktif'), ('XI','XI-IPS-5','Aktif');

insert into tb_kelas (jenjang_kelas, nama_kelas, status_kelas)
	values
		('XII','XII-IPA-1','Aktif'), ('XII','XII-IPA-2','Aktif'), ('XII','XII-IPA-3','Aktif'), ('XII','XII-IPA-4','Aktif'), ('XII','XII-IPA-5','Aktif'),
		('XII','XII-IPS-1','Aktif'), ('XII','XII-IPS-2','Aktif'), ('XII','XII-IPS-3','Aktif'), ('XII','XII-IPS-4','Aktif'), ('XII','XII-IPS-5','Aktif');
		
-----------------------------------------------------------------
-- DDL DML tb_siswa ---------------------------------------------
-----------------------------------------------------------------
-- membuat table siswa
create table tb_siswa(
	nisn varchar(50),
	nama varchar(50),
	jns_kelamin varchar(50),
	tempat_lahir varchar(50),
	tanggal_lahir varchar(50),
	agama varchar(50),
	alamat varchar(50),
	telp_rumah varchar(50),
	berat_badan varchar(50),
	tinggi_badan varchar(50),
	golongan_darah varchar(50),
	anak_status varchar(50),
	anak_ke varchar(50),
	status_siswa varchar(50)
);

-- membuat primary key
alter table tb_siswa add primary key (nisn);

select * from tb_siswa;
insert into tb_siswa
	(nisn, nama, jns_kelamin, tempat_lahir, tanggal_lahir, agama, alamat, telp_rumah, berat_badan, tinggi_badan, golongan_darah, anak_status, anak_ke, status_siswa)
values
	('G651190091', 'Aryajaya Alamsyah', 'Laki-Laki', 'Jakarta', '1995-10-12', 'Islam', 'Depok', '0819-3285-5946', '60', '170', 'A', 'Kandung', '1', 'Siswa Aktif'),
	('G651190092', 'Ahmad Bilal Maulana', 'Laki-Laki', 'Jakarta', '1995-10-12', 'Islam', 'Depok', '0819-3285-5946', '60', '170', 'A', 'Kandung', '1', 'Siswa Aktif'),
	('G651190093', 'Amalia Azatil Ismah', 'Perempuan', 'Jakarta', '1995-10-12', 'Islam', 'Depok', '0819-3285-5946', '60', '170', 'A', 'Kandung', '1', 'Siswa Aktif'),
	('G651190094', 'Budi Raharjo', 'Laki-Laki', 'Jakarta', '1995-10-12', 'Islam', 'Depok', '0819-3285-5946', '60', '170', 'A', 'Kandung', '1', 'Siswa Aktif'),
	('G651190095', 'Sri Kusumadewi', 'Perempuan', 'Jakarta', '1995-10-12', 'Islam', 'Depok', '0819-3285-5946', '60', '170', 'A', 'Kandung', '1', 'Siswa Aktif');

update tb_siswa set status_siswa = 'Siswa Aktif' where nisn='G12';
