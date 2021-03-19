----------------------------------------------------------------------------------------------------
-- # DATA PEGAWAI # ================================================================================
----------------------------------------------------------------------------------------------------
-- Menambah data
insert into
	tb_pegawai (id_pegawai, nama_pegawai, jns_kelamin, tempat_lahir, tanggal_lahir, pendidikan_terakhir, tanggal_mulai_kerja)
values
	('IDP-0001','Imam Marzuki Shofi','Laki-Laki','Semarang','1972-08-17','Sarjana','2015-01-01'),
	('IDP-0002','Fenti Eka MUzayana','Perempuan','Jakarta','1972-08-17','SMA','2015-01-01'),
	('IDP-0003','Nurhayati Buslim','Perempuan','Jakarta','1972-08-17','SMA','2015-01-01');

-- Melihat data
select * from tb_pegawai;

select * from tb_cso;
insert into tb_cso (id_cso, id_pegawai, kemampuan_berbahasa)
	values ('IDC-0001','IDP-0001','Baik');

select * from tb_teller;
insert into tb_teller(id_teller, id_pegawai, ketelitian)
	values ('IDT-0001','IDP-0002','Baik'), ('IDT-0002','IDP-0003','Baik');

----------------------------------------------------------------------------------------------------
-- # DATA NASABAH # ================================================================================
----------------------------------------------------------------------------------------------------
-- melihat data nasabah
select * from tb_nasabah;

-- menambah data nasabah
insert into
	tb_nasabah (id_nasabah, nama_nasabah, jns_kelamin, tempat_lahir, tanggal_lahir, jns_identitas, nomor_identitas, pendidikan_terakhir, pekerjaan, penghasilan, tanggal_mendaftar)
values
	('IDN-0001','Aryajaya Alamsyah','Laki-Laki','Jakarta','1995-10-12','KTP','11140910000101','Sarjana','Pelajar/Mahasiswa','2000000',now()),
	('IDN-0002','Amalia Azatil Ismah','Perempuan','Jakarta','1995-10-12','KTP','11140910000102','Sarjana','Pelajar/Mahasiswa','1500000',now()),
	('IDN-0003','Maudy Ayunda','Perempuan','Jakarta','1995-10-12','KTP','11140910000103','Sarjana','Pelajar/Mahasiswa','1500000',now()),
	('IDN-0004','Roselin Titania','Perempuan','Jakarta','1995-10-12','KTP','11140910000104','Sarjana','Pelajar/Mahasiswa','1500000',now()),
	('IDN-0005','Syarifah Aini','Perempuan','Jakarta','1995-10-12','KTP','11140910000105','Sarjana','Pelajar/Mahasiswa','1500000',now());


-- data ahli waris
select * from tb_ahli_waris;
insert into tb_ahli_waris (id_nasabah, nama_ahli_waris, hubungan_darah)
	values ('IDN-0001','Annisa Utami','Istri');
	
-- data alamat
select * from tb_alamat;
insert into tb_alamat (id_nasabah, nama_jalan, rt, rw, kelurahan, kecamatan, kota, provinsi)
	values ('IDN-0001','Jl. Pipit 3 No 146','06','10','Depok Jaya','Pancoran Mas','Depok','Jawa Barat');

----------------------------------------------------------------------------------------------------
-- # DATA REKENING # ================================================================================
----------------------------------------------------------------------------------------------------
-- melihat data hewan kurban
select * from tb_hewan_kurban;

-- menambah data hewan kurban
insert into tb_hewan_kurban (id_hewan_kurban, hewan_kurban, minimal_setoran, tanggal_penarikan)
	values
		('1','Kambing','50000','2021-07-19'),
		('2','Kerbau','100000','2021-07-19'),
		('3','Sapi','150000','2021-07-19');
	
-- data rekening
select * from tb_rekening;
insert into tb_rekening (id_rekening, id_nasabah, id_cso, id_hewan_kurban, tanggal_buka, setoran_awal, saldo)
	values 
		('IDR-0001','IDN-0001','IDC-0001','1',now(),'100000','100000'),
		('IDR-0002','IDN-0001','IDC-0001','3',now(),'200000','200000'),
		('IDR-0003','IDN-0002','IDC-0001','3',now(),'200000','200000'),
		('IDR-0004','IDN-0003','IDC-0001','3',now(),'200000','200000'),
		('IDR-0005','IDN-0004','IDC-0001','3',now(),'200000','200000'),
		('IDR-0006','IDN-0005','IDC-0002','3',now(),'200000','200000');

-- data buku tabungan
select * from tb_buku_tabungan;

-- data ini saat pembukaan rekening
insert into tb_buku_tabungan (id_rekening, tanggal, debit, kredit, saldo)
	values
		('IDR-0001',now(),'0','100000','100000'),
		('IDR-0002',now(),'0','200000','200000'),
		('IDR-0003',now(),'0','200000','200000'),
		('IDR-0004',now(),'0','200000','200000'),
		('IDR-0005',now(),'0','200000','200000'),
		('IDR-0006',now(),'0','200000','200000');
	
-- data ini saat transaksi. Krena setiap transaksi akan dicatat di buku tabungan.
insert into tb_buku_tabungan (id_rekening, tanggal, debit, kredit, saldo)
	values
		('IDR-0001',now(),'0','50000','150000'),
		('IDR-0001',now(),'0','100000','250000'),
		('IDR-0001',now(),'250000','0','0');
	
----------------------------------------------------------------------------------------------------
-- # DATA TRANSAKSI # ==============================================================================
----------------------------------------------------------------------------------------------------
select * from tb_transaksi;
insert into tb_transaksi (id_transaksi, id_rekening, id_teller, jns_transaksi, tanggal_transaksi, nominal)
	values
		('TR-0001','IDR-0001','IDT','Setor',now(),'50000'),
		('TR-0002','IDR-0001','IDT','Setor',now(),'100000'),
		('TR-0003','IDR-0001','IDT','Tarik',now(),'250000');


----------------------------------------------------------------------------------------------------
-- # SELECT VIEW # =================================================================================
----------------------------------------------------------------------------------------------------
-- data nasabah
-- Melihat nama nasabah, nama ahli waris, hubungan darah 
select
	A.nama_nasabah, B.nama_ahli_waris, B.hubungan_darah, C.nama_jalan, C.rt, C.rw, C.kelurahan, C.kecamatan, C.kota, C.provinsi
from
	tb_nasabah as A,
	tb_ahli_waris as B,
	tb_alamat as C
where
	A.id_nasabah = B.id_nasabah and A.id_nasabah = C.id_nasabah;


-- data rekening
-- melihat id rekening, nama pemilik, nama hewan kurban, tanggal buka, tanggal tutup, setoran awal, saldo
select * from tb_rekening;
select
	A.id_rekening, B.nama_nasabah, C.hewan_kurban, A.tanggal_buka, A.tanggal_tutup, cast(A.setoran_awal as money), cast(A.saldo as money)
from 
	tb_rekening as A,
	tb_nasabah as B,
	tb_hewan_kurban as C
where 
	A.id_nasabah = B.id_nasabah and A.id_hewan_kurban = C.id_hewan_kurban
order by
	B.nama_nasabah asc;


-- data buku tabungan
-- melihat isi buku tabungan aryajaya dengan hewan kurban sapi
select
	C.nama_nasabah, B.tanggal, B.debit, B.kredit, B.saldo
from
	tb_rekening as A,
	tb_buku_tabungan as B,
	tb_nasabah as C
where
	(A.id_rekening = B.id_rekening and A.id_nasabah = C.id_nasabah) and (A.id_nasabah = 'IDN-0001' and A.id_rekening= 'IDR-0001');


-- data transaksi
-- melihat nasabah mana yang melakukan transaksi
select
	A.id_transaksi, C.nama_nasabah, A.jns_transaksi, A.tanggal_transaksi, A.nominal
from
	tb_transaksi as A,
	tb_rekening as B,
	tb_nasabah as C
where 
	A.id_rekening = B.id_rekening and B.id_nasabah = C.id_nasabah;

