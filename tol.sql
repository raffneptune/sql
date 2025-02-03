-- Membuat database TolSystem
CREATE DATABASE TolSystem;

-- Menggunakan database TolSystem
USE TolSystem;

-- Membuat tabel untuk menyimpan data kendaraan dalam antrian
CREATE TABLE antrian_kendaraan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kendaraan VARCHAR(255) NOT NULL,
    golongan VARCHAR(50) NOT NULL,
    waktu_masuk TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Membuat tabel untuk menyimpan tarif tol berdasarkan golongan
CREATE TABLE tarif_tol (
    golongan VARCHAR(50) PRIMARY KEY,
    tarif INT NOT NULL
);

-- Menyisipkan tarif tol untuk setiap golongan kendaraan
INSERT INTO tarif_tol (golongan, tarif)
VALUES
('golongan_1', 5000),   -- Golongan 1 (misalnya motor atau mobil kecil)
('golongan_2', 10000),  -- Golongan 2 (misalnya truk kecil)
('golongan_3', 15000);  -- Golongan 3 (misalnya truk besar)

-- Membuat tabel untuk menyimpan transaksi pembayaran tol
CREATE TABLE transaksi_tol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kendaraan_id INT,
    jarak INT NOT NULL,
    biaya INT NOT NULL,
    waktu_pembayaran TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kendaraan_id) REFERENCES antrian_kendaraan(id)
);

-- Contoh untuk menambah kendaraan ke dalam antrian
-- Misalnya kendaraan pertama adalah "Mobil Kecil - Golongan 1"
INSERT INTO antrian_kendaraan (kendaraan, golongan)
VALUES ('Mobil Kecil - Golongan 1', 'golongan_1');

-- Misalnya kendaraan kedua adalah "Truk Kecil - Golongan 2"
INSERT INTO antrian_kendaraan (kendaraan, golongan)
VALUES ('Truk Kecil - Golongan 2', 'golongan_2');

-- Contoh menghitung biaya tol untuk kendaraan di antrian
-- Mengambil golongan dan menghitung biaya tol berdasarkan jarak
SELECT a.kendaraan, a.golongan, t.tarif * 10 AS biaya_tol
FROM antrian_kendaraan a
JOIN tarif_tol t ON a.golongan = t.golongan
WHERE a.id = 1;  -- Contoh untuk kendaraan pertama

-- Menyimpan transaksi pembayaran tol
-- Misalnya kendaraan pertama membayar biaya tol setelah 10 km
INSERT INTO transaksi_tol (kendaraan_id, jarak, biaya)
SELECT id, 10, (SELECT tarif FROM tarif_tol WHERE golongan = 'golongan_1') * 10
FROM antrian_kendaraan
WHERE kendaraan = 'Mobil Kecil - Golongan 1';

-- Mengambil semua transaksi pembayaran yang telah dilakukan
SELECT t.kendaraan_id, a.kendaraan, t.jarak, t.biaya, t.waktu_pembayaran
FROM transaksi_tol t
JOIN antrian_kendaraan a ON t.kendaraan_id = a.id;

-- Menampilkan seluruh antrian kendaraan yang ada
SELECT * FROM antrian_kendaraan;

-- Menampilkan tarif tol untuk semua golongan
SELECT * FROM tarif_tol;