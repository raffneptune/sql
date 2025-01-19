-- Membuat Database Supermarket
CREATE DATABASE supermarket;

-- Menggunakan Database Supermarket
USE supermarket;

-- Tabel Kategori Produk (misalnya: makanan, minuman, perawatan, dsb.)
CREATE TABLE kategori_produk (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(255) NOT NULL
);

-- Tabel Produk
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(255) NOT NULL,
    id_kategori INT,
    harga DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL,
    FOREIGN KEY (id_kategori) REFERENCES kategori_produk(id_kategori)
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

-- Tabel Detail Transaksi (untuk menyimpan rincian produk yang dibeli)
CREATE TABLE detail_transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT,
    id_produk INT,
    kuantitas INT NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
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

-- Menambahkan Data Contoh Kategori Produk
INSERT INTO kategori_produk (nama_kategori) VALUES
('Makanan'),
('Minuman'),
('Perawatan'),
('Elektronik');

-- Menambahkan Data Contoh Produk
INSERT INTO produk (nama_produk, id_kategori, harga, stok) VALUES 
('Beras 5kg', 1, 60000, 100),
('Air Mineral 1.5L', 2, 5000, 200),
('Shampoo 500ml', 3, 20000, 50),
('Smartphone', 4, 1500000, 30),
('Mie Instan', 1, 3000, 150),
('Susu Full Cream 1L', 2, 22000, 80);

-- Menambahkan Data Contoh Pelanggan
INSERT INTO pelanggan (nama_pelanggan, email, telepon) VALUES 
('Andi Pratama', 'andi@contoh.com', '081234567890'),
('Budi Santoso', 'budi@contoh.com', '082345678901'),
('Cici Ananda', 'cici@contoh.com', '083456789012');

-- Menambahkan Data Transaksi
INSERT INTO transaksi (id_pelanggan, total) VALUES 
(1, 1580000),
(2, 50000),
(3, 30000);

-- Menambahkan Data Detail Transaksi (Produk yang dibeli oleh pelanggan)
INSERT INTO detail_transaksi (id_transaksi, id_produk, kuantitas, harga, subtotal) VALUES
(1, 1, 2, 60000, 120000),  -- Beras 5kg
(1, 2, 3, 5000, 15000),    -- Air Mineral 1.5L
(1, 3, 1, 20000, 20000),   -- Shampoo 500ml
(2, 4, 1, 1500000, 1500000), -- Smartphone
(3, 5, 10, 3000, 30000);   -- Mie Instan

-- Menambahkan Data Pembayaran
INSERT INTO pembayaran (id_transaksi, jumlah, metode_pembayaran) VALUES
(1, 1580000, 'Transfer Bank'),
(2, 50000, 'Tunai'),
(3, 30000, 'Kartu Kredit');