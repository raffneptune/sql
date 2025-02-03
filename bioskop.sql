-- Membuat tabel film untuk menyimpan daftar film yang tersedia
CREATE TABLE film (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    harga INT NOT NULL
);

-- Menambahkan data film yang tersedia
INSERT INTO film (nama, harga) VALUES 
('Film A', 50000),
('Film B', 60000),
('Film C', 70000),
('Film D', 55000);

-- Membuat tabel pembelian_tiket untuk mencatat transaksi pembelian tiket
CREATE TABLE pembelian_tiket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Membuat tabel detail_pembelian_tiket untuk mencatat detail film yang dibeli dan jumlah tiket
CREATE TABLE detail_pembelian_tiket (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pembelian_tiket_id INT,
    film_id INT,
    jumlah_tiket INT,
    total_harga INT,
    FOREIGN KEY (pembelian_tiket_id) REFERENCES pembelian_tiket(id),
    FOREIGN KEY (film_id) REFERENCES film(id)
);