-- Tabel kategori_game (induk dari tabel game)
CREATE TABLE genre (
    idgenre     VARCHAR2(5)    PRIMARY KEY,
    namaGenre   VARCHAR2(30)   NOT NULL
);

-- Tabel game
CREATE TABLE game (
    idgame      VARCHAR2(10)   PRIMARY KEY,
    namaGame    VARCHAR2(50)   NOT NULL,
    platform    VARCHAR2(20)   NOT NULL,
    harga       NUMBER(15)     NOT NULL,
    stok        NUMBER(10)     NOT NULL,
    idgenre     VARCHAR2(5),
    CONSTRAINT fk_genre FOREIGN KEY (idgenre) REFERENCES genre(idgenre)
);

-- Tabel furnitur
CREATE TABLE furnitur (
    idfurnitur  VARCHAR2(10)   PRIMARY KEY,
    nmFurnitur  VARCHAR2(50)   NOT NULL,
    bahan       VARCHAR2(30)   NOT NULL,
    harga       NUMBER(15)     NOT NULL,
    stok        NUMBER(10)     NOT NULL
);

-- Tabel produk
CREATE TABLE produk (
    idproduk    VARCHAR2(10)   PRIMARY KEY,
    nmProduk    VARCHAR2(50)   NOT NULL,
    kategori    VARCHAR2(30)   NOT NULL,
    harga       NUMBER(15)     NOT NULL,
    stok        NUMBER(10)     NOT NULL
);

-- Insert data genre
INSERT ALL
    INTO genre VALUES ('G001', 'Action')
    INTO genre VALUES ('G002', 'RPG')
    INTO genre VALUES ('G003', 'Sports')
    INTO genre VALUES ('G004', 'Strategy')
    INTO genre VALUES ('G005', 'Horror')
SELECT * FROM dual;

-- Insert data game
INSERT ALL
    INTO game VALUES ('GM001', 'Elden Ring',          'PC',      800000, 12, 'G001')
    INTO game VALUES ('GM002', 'FIFA 25',             'PS',      700000, 20, 'G003')
    INTO game VALUES ('GM003', 'Genshin Impact',      'Mobile',       0, 99, 'G002')
    INTO game VALUES ('GM004', 'Resident Evil 4',     'PC',      450000,  7, 'G005')
    INTO game VALUES ('GM005', 'Civilization VII',    'PC',      850000,  5, 'G004')
    INTO game VALUES ('GM006', 'eFootball 2025',      'Mobile',       0, 99, 'G003')
    INTO game VALUES ('GM007', 'Final Fantasy XVI',   'PS',      650000, 10, 'G002')
    INTO game VALUES ('GM008', 'Alien Isolation',     'PC',      150000, 15, 'G005')
SELECT * FROM dual;

-- Insert data furnitur
INSERT ALL
    INTO furnitur VALUES ('FN001', 'Kursi Kerja Ergonomis',  'Besi',  850000, 10)
    INTO furnitur VALUES ('FN002', 'Meja Makan Minimalis',   'Kayu', 1200000,  5)
    INTO furnitur VALUES ('FN003', 'Lemari Pakaian 3 Pintu', 'Kayu', 2500000,  3)
    INTO furnitur VALUES ('FN004', 'Rak Buku Dinding',       'Besi',  350000, 20)
    INTO furnitur VALUES ('FN005', 'Sofa L-Shape',           'Kayu', 4500000,  2)
    INTO furnitur VALUES ('FN006', 'Meja Belajar Lipat',     'Kayu',  600000,  8)
    INTO furnitur VALUES ('FN007', 'Kursi Bar Minimalis',    'Besi',  450000, 12)
    INTO furnitur VALUES ('FN008', 'Tempat Tidur Single',    'Kayu', 1800000,  6)
SELECT * FROM dual;

-- Insert data produk
INSERT ALL
    INTO produk VALUES ('PR001', 'Mechanical Keyboard', 'Aksesoris PC',  750000, 15)
    INTO produk VALUES ('PR002', 'Mouse Gaming',        'Aksesoris PC',  350000, 25)
    INTO produk VALUES ('PR003', 'Monitor 24 inch',     'Elektronik',   2100000,  7)
    INTO produk VALUES ('PR004', 'Headset Wireless',    'Elektronik',    850000, 10)
    INTO produk VALUES ('PR005', 'Kabel HDMI 2m',       'Aksesoris PC',   45000, 50)
    INTO produk VALUES ('PR006', 'Webcam HD 1080p',     'Elektronik',    650000,  8)
    INTO produk VALUES ('PR007', 'Mouse Pad XL',        'Aksesoris PC',   95000, 30)
    INTO produk VALUES ('PR008', 'USB Hub 4 Port',      'Aksesoris PC',  120000, 20)
SELECT * FROM dual;

commit;

select * from genre;
select * from game;
select * from furnitur;
select * from produk;
--cari data spesifik dari salah satu tabel
select nmproduk, kategori, harga from produk where idproduk = 'PR004';
select kategori, harga from produk where idproduk = 'PR004';

--cari data tabel yang tidak duplikat
select DISTINCT kategori from produk;

--sortir data table yang ingin di tampilkan
select bahan, count(*) as jumlah_furnitur
from furnitur group by bahan;

--pengurutan data tabel tertentu
select * from produk order by harga asc; --kecil ke besar
select * from furnitur order by stok desc; --besar ke kecil

--kalo mau tau apa aja table didalam nonnection/database
select * from tab;

--liat struktur tabel
desc genre;
desc game;

--klausa select, aritmatik
select nmfurnitur, stok+10 from furnitur where idfurnitur = 'FN005'
--select namagame, harga, harga - (harga * 0.20) from game where idgame = 'GM001';
--select nmFurnitur, harga, harga + (harga * 0.11);
--FROM furnitur;

--kolom alias
select namagame as "zyrexgame", platform as Device, harga "rupiah" from game;

--fungsi konkat table tertentu
select nmfurnitur || ' - ' || bahan as "ingpo furnitur" from furnitur;

--fungsi literal table tertentu
select namagame, 'tersedia di platform', platform from game;
select namagame, platform 'spesifikasi tertera' from game;
select 'game ini', namagame, platform from game;

--operator logika AND
select namagame, platform, harga from game where platform = 'PC' and harga > 350000;
select namagame, platform, harga from game where platform = 'PC' and harga < 350000;
select namagame, platform, harga from game where platform = 'PC' and harga >= 350000;
select namagame, platform, harga from game where platform = 'pc' and harga < 150000;

--operator logika and
select namagame, platform, harga from game where platform = 'PS' or platform = 'Mobile';
select namagame, platform, harga from game where platform = 'PS' or platform = 'PC;

--operator NOT
select nmfurnitur, harga from furnitur where not harga < 1000000;
select nmfurnitur, bahan from furnitur where harga < 1000000;

SELECT namagame, platform FROM game WHERE platform IN ('PC', 'PS')

