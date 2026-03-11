SQL> --nama : Rizqi Nawaf Putra Rosyadi
SQL> --nim : 103122430010
SQL> CREATE TABLE kategori_gadget (
  2      id_ktg CHAR(5) CONSTRAINT pk_ktg PRIMARY KEY,
  3      nama_ktg VARCHAR2(20)
  4  );

Table created.

SQL> INSERT INTO kategori_gadget VALUES ('LP01', 'Laptop');

1 row created.

SQL> INSERT INTO kategori_gadget VALUES ('HP01', 'Handphone');

1 row created.

SQL> UPDATE kategori_gadget SET nama_ktg = 'Smartphone' WHERE id_ktg = 'HP01'
  2  ;

1 row updated.

SQL> DELETE FROM kategori_gadget WHERE id_ktg = 'LP01';

1 row deleted.

SQL> SELECT * FROM kategori_gadget;

ID_KT NAMA_KTG                                                                  
----- --------------------                                                      
HP01  Smartphone                                                                

SQL> CREATE TABLE produk_masuk (
  2      id_produk CHAR(6) NOT NULL CONSTRAINT pk_produk PRIMARY KEY,
  3      nama_item VARCHAR2(20)
  4  );
CREATE TABLE produk_masuk (
             *
ERROR at line 1:
ORA-00955: name is already used by an existing object 


SQL> DROP TABLE produk_masuk CASCADE CONSTRAINTS;

Table dropped.

SQL> CREATE TABLE produk_masuk (
  2    2      id_produk CHAR(6) NOT NULL CONSTRAINT pk_produk PRIMARY KEY,
  3    3      nama_item VARCHAR2(20)
  4    4  );
  2      id_produk CHAR(6) NOT NULL CONSTRAINT pk_produk PRIMARY KEY,
  *
ERROR at line 2:
ORA-00904: : invalid identifier 


SQL> CREATE TABLE produk_masuk (
  2      id_produk CHAR(6) NOT NULL CONSTRAINT pk_produk PRIMARY KEY,
  3      nama_item VARCHAR2(20)
  4  );

Table created.

SQL> INSERT INTO produk_masuk VALUES ('HP0001', 'iPhone 15');

1 row created.

SQL> INSERT INTO produk_masuk VALUES ('TB0001', 'Tablet Android');

1 row created.

SQL> SELECT * FROM produk_masuk;

ID_PRO NAMA_ITEM                                                                
------ --------------------                                                     
HP0001 iPhone 15                                                                
TB0001 Tablet Android                                                           

SQL> ALTER TABLE produk_masuk RENAME COLUMN id_produk TO id_ktg;

Table altered.

SQL> MERGE INTO kategori_gadget k
  2  USING (SELECT id_ktg, nama_item FROM produk_masuk) p
  3  ON (k.id_ktg = p.id_ktg)
  4  WHEN MATCHED THEN
  5  UPDATE SET k.nama_ktg = p.nama_item
  6  WHEN NOT MATCHED THEN
  7  INSERT (id_ktg, nama_ktg)
  8  VALUES (p.id_ktg, p.nama_item);
     VALUES (p.id_ktg, p.nama_item)
            *
ERROR at line 8:
ORA-12899: value too large for column "SYSTEM"."KATEGORI_GADGET"."ID_KTG" 
(actual: 6, maximum: 5) 


SQL> ALTER TABLE kategori_gadget MODIFY (id_ktg CHAR(6));

Table altered.

SQL> MERGE INTO kategori_gadget k
  2  USING (SELECT id_ktg, nama_item FROM produk_masuk) p
  3  ON (k.id_ktg = p.id_ktg)
  4  WHEN MATCHED THEN
  5  UPDATE SET k.nama_ktg = p.nama_item
  6  WHEN NOT MATCHED THEN
  7  INSERT (id_ktg, nama_ktg)
  8  VALUES (p.id_ktg, p.nama_item);

2 rows merged.

SQL> ALTER TABLE produk_masuk ADD harga NUMBER;

Table altered.

SQL> UPDATE produk_masuk SET harga = 15000000 WHERE id_ktg = 'HP0001';

1 row updated.

SQL> UPDATE produk_masuk SET harga = 3500000 WHERE id_ktg = 'TB0001';

1 row updated.

SQL> CREATE VIEW gadget_premium AS
  2  SELECT id_ktg, nama_item, harga
  3  FROM produk_masuk
  4  WHERE harga > 5000000;

View created.

SQL> SELECT * FROM gadget_premium;

ID_KTG NAMA_ITEM                 HARGA                                          
------ -------------------- ----------                                          
HP0001 iPhone 15              15000000                                          

SQL> CREATE MATERIALIZED VIEW gadget_premium AS
  2  (SELECT id_ktg, nama_item, harga
  3  FROM produk_masuk
  4  WHERE harga > 5000000);
WHERE harga > 5000000)
              *
ERROR at line 4:
ORA-00955: name is already used by an existing object 


SQL> DROP MATERIALIZED VIEW gadget_premium;
DROP MATERIALIZED VIEW gadget_premium
*
ERROR at line 1:
ORA-12003: materialized view or zonemap "SYSTEM"."GADGET_PREMIUM" does not 
exist 


SQL>  CREATE MATERIALIZED VIEW gadget_premiumm AS
  2  (SELECT id_ktg, nama_item, harga
  3  FROM produk_masuk
  4  WHERE harga > 5000000);

Materialized view created.

SQL> SELECT * FROM gadget_premiumm;

ID_KTG NAMA_ITEM                 HARGA                                          
------ -------------------- ----------                                          
HP0001 iPhone 15              15000000                                          

SQL> SPOOL OFF
