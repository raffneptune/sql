CREATE DATABASE kasir_system;
USE kasir_system;

-- Tabel untuk menyimpan daftar barang
CREATE TABLE barang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    harga DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel untuk menyimpan transaksi
CREATE TABLE transaksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_harga DOUBLE NOT NULL,
    uang_dibayar DOUBLE NOT NULL,
    kembalian DOUBLE NOT NULL
);

-- Tabel untuk menyimpan detail transaksi
CREATE TABLE detail_transaksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaksi_id INT,
    barang_id INT,
    jumlah INT NOT NULL,
    total DOUBLE NOT NULL,
    FOREIGN KEY (transaksi_id) REFERENCES transaksi(id) ON DELETE CASCADE,
    FOREIGN KEY (barang_id) REFERENCES barang(id) ON DELETE CASCADE
);

-- Contoh data barang
INSERT INTO barang (nama, harga) VALUES
('Beras', 50000),
('Gula', 15000),
('Minyak Goreng', 30000),
('Susu', 20000),
('Roti', 10000);