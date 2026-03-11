SQL> --nama : Rizqi Nawaf Putra Rosyadi
SQL> --NIM : 103122430010
SQL> CREATE TABLE Film (
  2      tahun INT,
  3      durasi INT,
  4      judul VARCHAR(100) NOT NULL,
  5      sinopsis VARCHAR(200),
  6      id_film INT PRIMARY KEY
  7  );

Table created.

SQL> CREATE TABLE Theater (
  2      kapasitas INT,
  3      kelas VARCHAR(20),
  4      harga INT,
  5      id_theater INT PRIMARY KEY
  6  );

Table created.

SQL> CREATE TABLE Member (
  2      email VARCHAR(50),
  3      tgl_lahir DATE,
  4      nama VARCHAR(50),
  5      no_hp VARCHAR(15),
  6      id_member INT PRIMARY KEY
  7  );

Table created.

SQL> CREATE TABLE Inventaris (
  2      nomor_kursi VARCHAR(5),
  3      id_theater INT,
  4      id_inventaris INT PRIMARY KEY,
  5      FOREIGN KEY (id_theater) REFERENCES Theater(id_theater)
  6  );

Table created.

SQL> CREATE TABLE Jadwal (
  2      periode_end DATE,
  3      id_film INT,
  4      id_theater INT,
  5      periode_start DATE,
  6      id_jadwal INT PRIMARY KEY,
  7      FOREIGN KEY (id_film) REFERENCES Film(id_film),
  8      FOREIGN KEY (id_theater) REFERENCES Theater(id_theater)
  9  );

Table created.

SQL> CREATE TABLE Transaksi (
  2      total_harga INT,
  3      status VARCHAR(15),
  4      tanggal DATE,
  5      id_member INT,
  6      id_jadwal INT,
  7      kode_pemesanan VARCHAR(20) PRIMARY KEY,
  8      FOREIGN KEY (id_jadwal) REFERENCES Jadwal(id_jadwal),
  9      FOREIGN KEY (id_member) REFERENCES Member(id_member)
 10  );

Table created.

SQL> INSERT INTO Film (tahun, durasi, judul, sinopsis, id_film)
  2  VALUES (2023, 148, 'Sapidermen', 'laba-laba sunda', 1);

1 row created.

SQL> INSERT INTO Theater (kapasitas, kelas, harga, id_theater)
  2  VALUES (50, 'VIP', 75000, 201);

1 row created.

SQL> INSERT INTO Member (email, tgl_lahir, nama, no_hp, id_member)
  2  VALUES ('nawaf@mail.com', TO_DATE('2007-09-28', 'YYYY-MM-DD'), 'nawaf', '08666666', 301);

1 row created.

SQL> INSERT INTO Inventaris (nomor_kursi, id_theater, id_inventaris)
  2  VALUES ('B12', 201, 401);

1 row created.

SQL> INSERT INTO Jadwal (periode_end, id_film, id_theater, periode_start, id_jadwal)
  2  VALUES (TO_DATE('2024-03-12 21:00', 'YYYY-MM-DD HH24:MI'), 1, 201, TO_DATE('2024-03-12 19:00', 'YYYY-MM-DD HH24:MI'), 501);

1 row created.

SQL> INSERT INTO Transaksi (total_harga, status, tanggal, id_member, id_jadwal, kode_pemesanan)
  2  VALUES (75000, 'LUNAS', TO_DATE('2024-03-11', 'YYYY-MM-DD'), 301, 501, 'BOOK-001');

1 row created.

SQL> UPDATE Film
  2  SET judul = 'Spider-Man Sunda',
  3      sinopsis = 'pahlawan laba-laba dari tanah sunda'
  4  WHERE id_film = 1;

1 row updated.

SQL> UPDATE Theater
  2  SET harga = 80000
  3  WHERE id_theater = 201;

1 row updated.

SQL> UPDATE Member
  2  SET no_hp = '08123456789'
  3  WHERE id_member = 301;

1 row updated.

SQL> UPDATE Inventaris
  2  SET nomor_kursi = 'C10'
  3  WHERE id_inventaris = 401;

1 row updated.

SQL> UPDATE Transaksi
  2  SET status = 'SELESAI'
  3  WHERE kode_pemesanan = 'BOOK-001';

1 row updated.

SQL> DELETE FROM Inventaris
  2  WHERE id_inventaris = 401;

1 row deleted.

SQL> DELETE FROM Transaksi
  2  WHERE kode_pemesanan = 'BOOK-001';

1 row deleted.

SQL> SPOOL OFF
