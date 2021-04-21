----------------------------------------------------------------------------------------------------
-- # PROSES BISNIS # ===============================================================================
----------------------------------------------------------------------------------------------------
1. Koperasi Bangun Persada merupakan salah satu koperasi yang ada di Kecamatan Beji Depok, koperasi ini berbasis muamalat.
2. Koperasi melayani masyarakat untuk menabung hewan kurban dengan syarat
	- Proses menabung uang dapat dilakukan setiap hari sebelum h-14 idul adha.
	- Proses menarik uang hanya dapat dilakukan h-3 sampai h+3 idul adha
	- Hewan kurban yang tersedia adalah Kambing, Kerbau, Sapi.
	- Setoran Awal Kambing adalah 50rb, Kerbau 100rb, Sapi 150rb.
3. Koperasi ini memiliki beberapa pegawai. Data pegawai memiliki attribut nama pegawai, jns kelamin, Usia, pendidikan terakhir, tanggal mulai kerja, tanggal berhenti kerja).
4. Pegawai akan terbagi menjadi 2 cso dan teller
	- Apabila cso maka memiliki attribut tambahan kemampuan menjelaskan
	- Apabila teller maka memiliki attribut tambahan ketelitian
	- Tugas cso adalah membantu masyarakat untuk membuka rekening dan teller untuk menabung dan menarik uang
5. data nasabah memiliki attribut nama nasabah, jns kelamin, usia, alamat, jns identitas, nomor identitas, pendidikan terakhir, pekerjaan, penghasilan, tanggal mendaftar dan tanggal berhenti.
	- alamat memiliki pola nama jalan, rt rw, kelurahan, kecamatan, kota, provinsi.
	- setiap nasabah memiliki ahli waris, dengan rincian data nama ahli waris dan hubungan darah.
6. data rekening memiliki attribut id rekening, tanggal buka, tanggal tutup, setoran awal, saldo.
	- Setiap nasabah dapat membuka beberapa rekning sekaligus namun satu rekening hanya dimiliki oleh satu nasabah
	- setiap rekening hanya untuk satu hewan kurban (Diasumsikan).
	- setiap rekening dilayani oleh satu cso namun satu cso dapat melayi beberapa rekening.
	- setiap rekening memiliki buku tabungan dengan attribut tanggal, debit, kredit, saldo.
7. data transaksi memiliki attribut id transaksi, jns transaksi, tanggal transaksi, nominal.
	- data transaksi akan mencatat proses menabung dan manarik uang.
	- Setiap rekening dapat melakukan beberapa transaksi dan satu transaksi hanya dilakukan oleh satu rekening.
	- setiap transaksi akan dilayani oleh seorang teller dan satu teller dapat melayani beberapa transaksi


----------------------------------------------------------------------------------------------------
-- # DATABASE TABUNGAN KURBAN # ====================================================================
----------------------------------------------------------------------------------------------------
create database db_tabungan_kurban;


----------------------------------------------------------------------------------------------------
-- # DATA PEGAWAI # ================================================================================
----------------------------------------------------------------------------------------------------
-- membuat tabel pegawai
-- drop table tb_pegawai;
create table tb_pegawai(
	id_pegawai varchar(50) not null primary key,
	nama_pegawai varchar(50) not null,
	jns_kelamin varchar(50) not null,
	tempat_lahir varchar(50) not null,
	tanggal_lahir date not null,
	pendidikan_terakhir varchar(50) not null,
	tanggal_mulai_kerja date null,
	tanggal_berhenti_kerja date null
);

-- drop table tb_cso
create table tb_cso(
	id_cso varchar(50) not null primary key, 
	id_pegawai varchar(50) not null,
	kemampuan_berbahasa varchar(50) not null
);

-- drop table tb_teller
create table tb_teller(
	id_teller varchar(50) not null primary key,
	id_pegawai varchar(50) not null,
	ketelitian varchar(50) not null
);

-- Note (sebaiknya dibuat check constraint) pd data pegawai
-- 		Pendidikan Terakhir : SMA, D3, S1, S2, S3
--		Kemampuan Berbahasa : Baik, Sedang, Buruk
--		Ketelitian 			: Baik, Sedang, Buruk


----------------------------------------------------------------------------------------------------
-- # DATA NASABAH # ================================================================================
----------------------------------------------------------------------------------------------------
-- membuat tabel nasabah
create table tb_nasabah(
	id_nasabah varchar(50) not null primary key,
	nama_nasabah varchar(50) not null,
	jns_kelamin varchar(50) not null,
	tempat_lahir varchar(50) not null,
	tanggal_lahir date not null,
	jns_identitas varchar(50) not null,
	nomor_identitas varchar(50) not null,
	pendidikan_terakhir varchar(50) not null,
	pekerjaan varchar(50) not null,
	penghasilan bigint not null,
	tanggal_mendaftar date null,
	tanggal_berhenti date null
);

-- membuat table ahli waris
create table tb_ahli_waris(
	id_ahli_waris serial not null primary key,
	id_nasabah varchar(50) not null, 
	nama_ahli_waris varchar(50) not null,
	hubungan_darah varchar(50) not null
);

-- membuat table alamat
create table tb_alamat (
	id_alamat serial not null primary key,
	id_nasabah varchar (50) not null,
	nama_jalan varchar(50) not null,
	rt varchar(50) not null,
	rw varchar(50) not null,
	kelurahan varchar(50) not null,
	kecamatan varchar(50) not null,
	kota varchar(50) not null,
	provinsi varchar(50) not null
);

-- Note (sebaiknya dibuat check constraint) pada data nasabah
--	Pendidikan terakhir : SMA, D3, S1, S2, S3
--	Pekerjaan			: Pegawai Negeri, Pegawai Swasta, TNI-Polri, Ibu Rumah Tangga, Pelajar-Mahasiswa, Wiraswasta, Lainnya
-- 	Penghasilan			: > 1.000.000, 1.000.000 - 5.000.000, 5.000.000 - 10.000.000, < 10.000.000
--	Hubungan darah	: Suami, Istri, Anak, Paman, Bibi, Om, Tante


-----------------------------------------------------------------------------------------------------
-- # DATA REKENING # ================================================================================
-----------------------------------------------------------------------------------------------------
-- membuat tabel hewan kurban
create table tb_hewan_kurban(
	id_hewan_kurban varchar(50) not null primary key,
	hewan_kurban varchar(50) not null,
	minimal_setoran bigint not null,
	tanggal_penarikan date not null
);

-- membuat table rekening
create table tb_rekening(
	id_rekening varchar(50) not null primary key,
	id_nasabah varchar(50) not null,
	id_cso varchar(50) not null,
	id_hewan_kurban varchar(50) not null,
	tanggal_buka date null,
	tanggal_tutup date null,
	setoran_awal bigint not null,
	saldo bigint not null
);

-- membuat table buku tabungan
create table tb_buku_tabungan(
	id_buku_tabungan serial not null primary key,
	id_rekening varchar(50) not null,
	tanggal timestamp not null,
	debit bigint not null,
	kredit bigint not null,
	saldo bigint not null
);

------------------------------------------------------------------------------------------------------
-- # DATA TRANSAKSI # ================================================================================
------------------------------------------------------------------------------------------------------
create table tb_transaksi(
	id_transaksi varchar(50) not null primary key,
	id_rekening varchar(50) not null,
	id_teller varchar(50) not null,
	jns_transaksi varchar(50) not null,
	tanggal_transaksi timestamp not null,
	nominal bigint not null
);




















