-- membuat database krs
create database db_krs;

-- tahun ajar
-- drop table tb_tahun_ajar;
create table tb_tahun_ajar(
	id_tahun_ajar varchar(50) primary key,
	nama_tahun_ajar varchar(50),
	semester varchar(50),
	status_tahun_ajar varchar(50)
);

insert into tb_tahun_ajar (id_tahun_ajar, nama_tahun_ajar, semester, status_tahun_ajar)
	values
	('IDT-0001','2019/2020','Ganjil','Tidak Aktif'), ('IDT-0002','2019/2020','Genap','Tidak Aktif'),
	('IDT-0003','2020/2021','Ganjil','Tidak Aktif'), ('IDT-0004','2020/2021','Genap','Aktif');

select * from tb_tahun_ajar;


-- mata kuliah
-- drop table tb_mata_kuliah;
create table tb_mata_kuliah(
	kode_mk varchar(50) primary key,
	nama_mk varchar(50),
	sks varchar(50),
	semester varchar(50),
	status_mata_kuliah varchar(50)
);

-- mk smstr 1
insert into tb_mata_kuliah (kode_mk, nama_mk, sks, semester, status_mata_kuliah)
	values
	('KMK-0001','Bahasa Indonesia','2','1','Aktif'),
	('KMK-0002','Bahasa Arab 1','2','1','Aktif'),
	('KMK-0003','Bahasa Inggris 1','2','1','Aktif'),
	('KMK-0004','Dasar-Dasar Pemrograman','6','1','Aktif'),
	('KMK-0005','Filsafat ilmu','2','1','Aktif'),
	('KMK-0006','Matematika Diskrit','3','1','Aktif'),
	('KMK-0007','Matematik Dasar 1','3','1','Aktif'),
	('KMK-0008','Pancasila dan Kewarganegaraan','2','1','Aktif'),
	('KMK-0009','Studi Islam 1','2','1','Aktif');

-- mk smstr 2
insert into tb_mata_kuliah (kode_mk, nama_mk, sks, semester, status_mata_kuliah)
	values
	('KMK-0010','Bahasa Arab 2','2','2','Aktif'),
	('KMK-0011','Bahasa Inggris 2','2','2','Aktif'),
	('KMK-0012','Aljabar Linier','3','2','Aktif'),
	('KMK-0013','Pengantar Sistem Digital','4','2','Aktif'),
	('KMK-0014','Sistem Basis Data','4','2','Aktif'),
	('KMK-0015','Struktur Data','3','2','Aktif'),
	('KMK-0016','Studi Islam 2','2','2','Aktif');

-- mk smstr 3
insert into tb_mata_kuliah (kode_mk, nama_mk, sks, semester, status_mata_kuliah)
	values
	('KMK-0017','Analisis Desain Sistem','3','3','Aktif'),
	('KMK-0018','Komunikasi Data','3','3','Aktif'),
	('KMK-0019','Matematika Dasar 2','3','3','Aktif'),
	('KMK-0020','Metode Numerik','3','3','Aktif'),
	('KMK-0021','Pengantar Organisasi Komputer','3','3','Aktif'),
	('KMK-0022','Perancangan dan Pemrograman Web','3','3','Aktif');
	
select * from tb_mata_kuliah;


--  mahasiswa
-- drop table tb_mahasiswa;
create table tb_mahasiswa(
	nim varchar(50) primary key,
	nama varchar(50),
	jenis_kelamin varchar(50),
	tempat_lahir varchar(50),
	tanggal_lahir date,
	alamat varchar(50),
	semester varchar(50),
	status_mahasiswa varchar(50)
);

insert into tb_mahasiswa (nim, nama, jenis_kelamin, tempat_lahir, tanggal_lahir, alamat, semester, status_mahasiswa) 
	values 
	('11140910000101','Aryajaya Alamsyah','Laki-Laki','Jakarta','1995-10-12','Jl. Pipit 3 No 146','1','Alumni'),
	('11140910000102','Amalia Azatil Ismah','Perempuan','Jakarta','1995-10-12','Jl. Raya Ciputat No 1','1','Aktif'),
	('11140910000103','Annisa Utami','Perempuan','Jakarta','1995-10-12','Jl. Raya Ciputat No 2','1','Aktif');

select * from tb_mahasiswa;


-- krs
-- drop table tb_krs;
create table tb_krs(
	nim varchar(50),
	kode_mk varchar(50),
	id_tahun_ajar varchar(50),
	formatif int,
	uts int,
	uas int,
	nilai_akhir int,
	huruf_mutu varchar(50)
);

-- membuat primary key. Karena table krs merupakan table komposite
alter table tb_krs add primary key (nim, kode_mk, id_tahun_ajar);

-- melihat isi data krs
select * from tb_krs;

-- ================================================================================================
-- Procedure dan Trigger --------------------------------------------------------------------------
-- ================================================================================================
-- procedure
-- drop function set_nilai_mutu;
create or replace function set_nilai_mutu()
	returns trigger AS
$BODY$
begin
	new.nilai_akhir = (new.formatif * 0.3) + (new.uts * 0.3) + (new.uas * 0.4);
	case
		when new.nilai_akhir > 80 then
    		new.huruf_mutu = 'A';
    	when new.nilai_akhir > 70 then
    		new.huruf_mutu = 'B';
    	when new.nilai_akhir > 60 then
    		new.huruf_mutu = 'C';
    	when new.nilai_akhir > 50 then
    		new.huruf_mutu = 'D';
    	else
	    	new.huruf_mutu = 'E';
    end case;
	return new;
end;
$BODY$ language plpgsql;

-- trigger
-- drop trigger set_nilai_mutu on tb_krs;
create trigger set_nilai_mutu
	before insert on tb_krs for each row
	execute procedure set_nilai_mutu();

-- ================================================================================================
-- Uji coba procedure dan Trigger -----------------------------------------------------------------
-- ================================================================================================
insert into tb_krs (nim, kode_mk, id_tahun_ajar, formatif,  uts, uas) 
	values ('11140910000103', 'KMK-0001', 'IDT-0004', '70', '90', '85');
select * from tb_krs;



