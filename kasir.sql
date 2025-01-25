-- Membuat database
CREATE DATABASE kasir_db;

-- Menggunakan database
USE kasir_db;

-- Tabel untuk menyimpan daftar barang yang ditambahkan selama transaksi
CREATE TABLE daftar_barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    jumlah INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

-- Tabel untuk mencatat rincian pembayaran
CREATE TABLE pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    total_belanja DECIMAL(10, 2) NOT NULL,
    uang_dibayar DECIMAL(10, 2) NOT NULL,
    kembalian DECIMAL(10, 2) NOT NULL,
    tanggal_transaksi DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Trigger untuk mencatat transaksi pembayaran dan membersihkan tabel daftar_barang setelah pembayaran
DELIMITER $$
CREATE TRIGGER after_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    DELETE FROM daftar_barang;
END$$
DELIMITER ;