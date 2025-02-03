CREATE DATABASE sistem_kereta;
USE sistem_kereta;

-- Tabel untuk menyimpan daftar kereta
CREATE TABLE kereta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    tujuan VARCHAR(100) NOT NULL,
    waktu_berangkat TIME NOT NULL,
    kapasitas INT NOT NULL,
    terisi INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel untuk menyimpan pemesanan tiket
CREATE TABLE pemesanan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kereta_id INT,
    jumlah_tiket INT NOT NULL,
    tanggal_pemesanan TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kereta_id) REFERENCES kereta(id) ON DELETE CASCADE
);

-- Contoh data kereta
INSERT INTO kereta (nama, tujuan, waktu_berangkat, kapasitas, terisi) VALUES
('Ekspres Jakarta', 'Bandung', '10:00:00', 100, 0),
('Argo Bromo', 'Surabaya', '15:00:00', 150, 0),
('Kelas Ekonomi', 'Yogyakarta', '12:00:00', 200, 0);