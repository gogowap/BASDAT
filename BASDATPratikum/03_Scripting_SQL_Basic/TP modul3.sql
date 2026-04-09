CREATE TABLE mahasiswa (
    id NUMBER PRIMARY KEY,
    nama VARCHAR2(100),
    tempat_lahir VARCHAR2(50),
    tanggal_lahir DATE,
    nomor_hp VARCHAR2(15),
    email VARCHAR2(50),
    tinggi_badan NUMBER,
    berat_badan NUMBER
);



INSERT ALL 
INTO mahasiswa VALUES (1, 'Andi Wijaya', 'Jakarta', TO_DATE('2002-05-15', 'YYYY-MM-DD'), '081234567890', 'andi@mail.com', 170, 65)
INTO mahasiswa VALUES (2, 'Budi Santoso', 'Bandung', TO_DATE('2001-08-22', 'YYYY-MM-DD'), '081234567891', 'budi.s@mail.com', 175, 70)
INTO mahasiswa VALUES (3, 'Citra Lestari', 'Surabaya', TO_DATE('2003-01-10', 'YYYY-MM-DD'), '081234567892', 'citra_l@mail.com', 160, 50)
INTO mahasiswa VALUES (4, 'Dedi Kurniawan', 'Medan', TO_DATE('2002-11-30', 'YYYY-MM-DD'), '081234567893', 'dedik@mail.com', 168, 60)
INTO mahasiswa VALUES (5, 'Eka Putri', 'Palembang', TO_DATE('2003-03-05', 'YYYY-MM-DD'), '081234567894', 'ekap@mail.com', 158, 48)
INTO mahasiswa VALUES (6, 'Fahmi Idris', 'Makassar', TO_DATE('2001-12-12', 'YYYY-MM-DD'), '081234567895', 'fahmi.i@mail.com', 180, 80)
INTO mahasiswa VALUES (7, 'Gita Gutawa', 'Yogyakarta', TO_DATE('2002-07-07', 'YYYY-MM-DD'), '081234567896', 'gita.g@mail.com', 162, 52)
INTO mahasiswa VALUES (8, 'Hadi Saputra', 'Semarang', TO_DATE('2001-04-18', 'YYYY-MM-DD'), '081234567897', 'hadis@mail.com', 172, 68)
INTO mahasiswa VALUES (9, 'Indah Permata', 'Denpasar', TO_DATE('2003-09-25', 'YYYY-MM-DD'), '081234567898', 'indah.p@mail.com', 165, 55)
INTO mahasiswa VALUES (10, 'Joko Susilo', 'Solo', TO_DATE('2002-02-14', 'YYYY-MM-DD'), '081234567899', 'joko_s@mail.com', 178, 75)
INTO mahasiswa VALUES (11, 'Kartika Sari', 'Malang', TO_DATE('2003-06-20', 'YYYY-MM-DD'), '081234567800', 'kartika@mail.com', 160, 50)
INTO mahasiswa VALUES (12, 'Lutfi Hakim', 'Bogor', TO_DATE('2001-10-05', 'YYYY-MM-DD'), '081234567801', 'lutfi.h@mail.com', 174, 72)
INTO mahasiswa VALUES (13, 'Maya Ahmad', 'Aceh', TO_DATE('2002-01-25', 'YYYY-MM-DD'), '081234567802', 'maya_a@mail.com', 159, 49)
INTO mahasiswa VALUES (14, 'Naufal Rizky', 'Padang', TO_DATE('2002-08-14', 'YYYY-MM-DD'), '081234567803', 'naufal@mail.com', 171, 66)
INTO mahasiswa VALUES (15, 'Olivia Rani', 'Manado', TO_DATE('2003-04-12', 'YYYY-MM-DD'), '081234567804', 'olivia@mail.com', 164, 54)
SELECT * FROM dual;

SELECT 
    LOWER(nama) AS nama_kecil,
    UPPER(nama) AS nama_besar,
    INITCAP(tempat_lahir) AS tempat_kapital,
    CONCAT(nama, email) AS gabung,
    LENGTH(nama) AS panjang_nama,
    SUBSTR(nama, 1, 3) AS tiga_huruf_awal,
    LPAD(id, 5, '0') AS id_pad,
    RPAD(nomor_hp, 15, '*') AS hp_sensor,
    LTRIM('   DATA') AS hapus_kiri,
    RTRIM('DATA   ') AS hapus_kanan,
    INSTR(email, '@') AS posisi_at,
    REPLACE(email, 'mail.com', 'gmail.com') AS ganti_domain
FROM mahasiswa;

SELECT 
    TO_CHAR(tanggal_lahir, 'MM/MON/MONTH') AS format_bulan,
    TO_CHAR(tanggal_lahir, 'DD/DY') AS format_hari,
    TO_CHAR(tanggal_lahir, 'YYYY/YY/RR') AS format_tahun,
    TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS waktu_skrg,
    ADD_MONTHS(tanggal_lahir, 12) AS tahun_depan,
    LAST_DAY(tanggal_lahir) AS akhir_bulan,
    NEXT_DAY(tanggal_lahir, 'MONDAY') AS senin_berikutnya,
    MONTHS_BETWEEN(SYSDATE, tanggal_lahir) AS usia_bulan,
    ROUND(tanggal_lahir, 'YEAR') AS pembulatan_tahun
FROM mahasiswa;

SELECT 
    TO_NUMBER('12345') AS ke_angka,
    TO_CHAR(tanggal_lahir, 'DD Month YYYY') AS tgl_ke_teks,
    TO_CHAR(tinggi_badan, '999') || ' cm' AS tinggi_ke_teks, -- Menambahkan satuan cm
    TO_DATE('2026-03-19', 'YYYY-MM-DD') AS teks_ke_tgl
FROM mahasiswa;

SELECT 
    id,
    tinggi_badan,
    ABS(-170) AS fungsi_abs,           
    MOD(id, 3) AS fungsi_mod,          
    FLOOR(tinggi_badan / 1.3) AS fungsi_floor, 
    CEIL(tinggi_badan / 1.3) AS fungsi_ceil,   
    POWER(id, 2) AS fungsi_power,      
    ROUND(tinggi_badan / 3, 2) AS fungsi_round 
FROM mahasiswa;