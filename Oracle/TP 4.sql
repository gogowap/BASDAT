-- Membuat Tabel Teater
CREATE TABLE teater (
    id_teater CHAR(4) NOT NULL,
    nama_teater VARCHAR2(20),
    tipe_teater VARCHAR2(10),
    CONSTRAINT teater_pk PRIMARY KEY (id_teater)
);

-- Membuat Tabel Kursi
CREATE TABLE kursi (
    id_kursi CHAR(5) NOT NULL,
    no_kursi VARCHAR2(5),
    id_teater CHAR(4),
    CONSTRAINT kursi_pk PRIMARY KEY (id_kursi),
    CONSTRAINT kursi_fk FOREIGN KEY (id_teater) 
        REFERENCES teater (id_teater) ON DELETE CASCADE
);

-- Mengisi Data Teater
INSERT INTO teater VALUES ('T001', 'Teater Satu', 'Reguler');
INSERT INTO teater VALUES ('T002', 'Teater Dua', 'Reguler');
INSERT INTO teater VALUES ('T003', 'Teater Tiga', 'Premiere');

-- Mengisi Data Kursi
INSERT INTO kursi VALUES ('K0001', 'A1', 'T001');
INSERT INTO kursi VALUES ('K0002', 'A2', 'T001');
INSERT INTO kursi VALUES ('K0003', 'B1', 'T002');

SELECT * FROM teater;


SELECT 
    T.ID_THEATER AS "Nomor Teater", 
    I.NOMOR_KURSI AS "Nomor Kursi"
FROM 
    THEATER_103122430010 T
LEFT OUTER JOIN 
    INVENTORI_103122430010 I ON T.ID_THEATER = I.ID_THEATER
ORDER BY 
    T.ID_THEATER ASC;