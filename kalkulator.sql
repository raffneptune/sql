-- Membuat Database Kalkulator
CREATE DATABASE kalkulator;

-- Menggunakan Database Kalkulator
USE kalkulator;

-- Tabel Riwayat Perhitungan
CREATE TABLE riwayat_perhitungan (
    id_perhitungan INT AUTO_INCREMENT PRIMARY KEY,
    operasi VARCHAR(20) NOT NULL,
    angka_pertama DECIMAL(10, 2) NOT NULL,
    angka_kedua DECIMAL(10, 2) NOT NULL,
    hasil DECIMAL(10, 2) NOT NULL,
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Menambahkan Data Contoh Riwayat Perhitungan
INSERT INTO riwayat_perhitungan (operasi, angka_pertama, angka_kedua, hasil) VALUES
('Penjumlahan', 10.00, 5.00, 15.00),
('Pengurangan', 20.00, 5.00, 15.00),
('Perkalian', 7.00, 3.00, 21.00),
('Pembagian', 25.00, 5.00, 5.00);