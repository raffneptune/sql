-- Membuat Database Kasir
CREATE DATABASE kasir;

-- Menggunakan Database Kasir
USE kasir;

-- Tabel Produk
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

-- Tabel Detail Transaksi
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

-- Menambahkan Data Contoh Produk
INSERT INTO produk (nama_produk, harga, stok) VALUES 
('Laptop', 15000000, 10),
('Mouse', 500000, 20),
('Keyboard', 800000, 15),
('Monitor', 3000000, 8);

-- Menambahkan Data Contoh Pelanggan
INSERT INTO pelanggan (nama_pelanggan, email, telepon) VALUES 
('John Doe', 'johndoe@gmail.com', '08123456789'),
('Jane Smith', 'janesmith@yahoo.com', '08987654321');

-- Menambahkan Data Transaksi
INSERT INTO transaksi (id_pelanggan, total) VALUES 
(1, 15500000),
(2, 2000000);

-- Menambahkan Data Detail Transaksi
INSERT INTO detail_transaksi (id_transaksi, id_produk, kuantitas, harga, subtotal) VALUES
(1, 1, 1, 15000000, 15000000),
(1, 2, 1, 500000, 500000),
(2, 3, 2, 800000, 1600000);

-- Menambahkan Data Pembayaran
INSERT INTO pembayaran (id_transaksi, jumlah, metode_pembayaran) VALUES
(1, 15500000, 'Transfer Bank'),
(2, 2000000, 'Tunai');