-- Membuat database WarnetSystem
CREATE DATABASE WarnetSystem;

-- Menggunakan database WarnetSystem
USE WarnetSystem;

-- Membuat tabel untuk menyimpan data komputer
CREATE TABLE komputer (
    komputer_id INT AUTO_INCREMENT PRIMARY KEY,
    nomor INT NOT NULL,
    tersedia BOOLEAN DEFAULT TRUE,
    durasi_sewa FLOAT DEFAULT 0,  -- Durasi sewa dalam menit
    biaya_sewa FLOAT DEFAULT 0,   -- Biaya sewa dalam IDR
    terakhir_sewa TIMESTAMP      -- Waktu terakhir komputer disewa
);

-- Menambahkan komputer ke dalam tabel (contoh untuk 5 komputer)
INSERT INTO komputer (nomor, tersedia)
VALUES
(1, TRUE),
(2, TRUE),
(3, TRUE),
(4, TRUE),
(5, TRUE);

-- Membuat tabel untuk menyimpan riwayat transaksi sewa
CREATE TABLE transaksi_sewa (
    transaksi_id INT AUTO_INCREMENT PRIMARY KEY,
    komputer_id INT,
    waktu_mulai TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    waktu_selesai TIMESTAMP,
    durasi_sewa FLOAT,          -- Durasi sewa dalam menit
    biaya_sewa FLOAT,          -- Biaya sewa dalam IDR
    FOREIGN KEY (komputer_id) REFERENCES komputer(komputer_id)
);

-- Contoh untuk menyewa komputer nomor 1
-- Menyisipkan transaksi sewa untuk komputer nomor 1
INSERT INTO transaksi_sewa (komputer_id, waktu_mulai)
VALUES (1, CURRENT_TIMESTAMP);

-- Mengupdate status sewa komputer (setelah selesai sewa)
-- Misalnya komputer 1 selesai disewa setelah 30 menit
UPDATE komputer
SET tersedia = TRUE, durasi_sewa = 30, biaya_sewa = 30 * 2000  -- 2000 IDR per menit
WHERE nomor = 1;

-- Menyimpan waktu selesai sewa di transaksi_sewa
UPDATE transaksi_sewa
SET waktu_selesai = CURRENT_TIMESTAMP, durasi_sewa = 30, biaya_sewa = 30 * 2000
WHERE komputer_id = 1 AND waktu_selesai IS NULL;

-- Menampilkan status komputer yang tersedia atau sedang disewa
SELECT nomor, tersedia
FROM komputer;

-- Menampilkan riwayat transaksi sewa
SELECT ts.transaksi_id, k.nomor AS komputer_nomor, ts.waktu_mulai, ts.waktu_selesai, ts.durasi_sewa, ts.biaya_sewa
FROM transaksi_sewa ts
JOIN komputer k ON ts.komputer_id = k.komputer_id;