-- Membuat Database Barbershop
CREATE DATABASE barbershop;

-- Menggunakan Database Barbershop
USE barbershop;

-- Tabel Layanan
CREATE TABLE layanan (
    id_layanan INT AUTO_INCREMENT PRIMARY KEY,
    nama_layanan VARCHAR(255) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL
);

-- Tabel Produk (misalnya: produk perawatan rambut, minyak rambut, dsb.)
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(255) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL
);

-- Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    telepon VARCHAR(15)
);

-- Tabel Transaksi
CREATE TABLE transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Tabel Detail Transaksi (untuk menyimpan rincian layanan dan produk yang dibeli)
CREATE TABLE detail_transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT,
    id_layanan INT DEFAULT NULL,
    id_produk INT DEFAULT NULL,
    kuantitas INT DEFAULT 1,
    harga DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
    FOREIGN KEY (id_layanan) REFERENCES layanan(id_layanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Tabel Pembayaran
CREATE TABLE pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT,
    jumlah DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50),
    tanggal_pembayaran TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
);

-- Menambahkan Data Contoh Layanan
INSERT INTO layanan (nama_layanan, harga) VALUES
('Potong Rambut', 50000),
('Cukur Jenggot', 25000),
('Pewarnaan Rambut', 100000),
('Perawatan Rambut', 75000);

-- Menambahkan Data Contoh Produk
INSERT INTO produk (nama_produk, harga, stok) VALUES 
('Shampo Rambut', 30000, 50),
('Minyak Rambut', 25000, 30),
('Pomade', 40000, 20);

-- Menambahkan Data Contoh Pelanggan
INSERT INTO pelanggan (nama_pelanggan, email, telepon) VALUES 
('Andi Pratama', 'andi@contoh.com', '081234567890'),
('Budi Santoso', 'budi@contoh.com', '082345678901');

-- Menambahkan Data Transaksi
INSERT INTO transaksi (id_pelanggan, total) VALUES 
(1, 125000),
(2, 80000);

-- Menambahkan Data Detail Transaksi (Layanan dan Produk)
INSERT INTO detail_transaksi (id_transaksi, id_layanan, harga, subtotal) VALUES
(1, 1, 50000, 50000), -- Potong Rambut
(1, 2, 25000, 25000), -- Cukur Jenggot
(2, 1, 50000, 50000); -- Potong Rambut

-- Menambahkan Data Pembayaran
INSERT INTO pembayaran (id_transaksi, jumlah, metode_pembayaran) VALUES
(1, 125000, 'Transfer Bank'),
(2, 80000, 'Tunai');