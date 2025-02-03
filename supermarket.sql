-- Membuat tabel produk
CREATE TABLE produk (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_produk TEXT NOT NULL,
    harga INTEGER NOT NULL
);

-- Memasukkan data produk ke dalam tabel
INSERT INTO produk (nama_produk, harga) VALUES ('Apel', 10000);
INSERT INTO produk (nama_produk, harga) VALUES ('Pisang', 8000);
INSERT INTO produk (nama_produk, harga) VALUES ('Jeruk', 12000);
INSERT INTO produk (nama_produk, harga) VALUES ('Mangga', 15000);
INSERT INTO produk (nama_produk, harga) VALUES ('Semangka', 20000);

-- Membuat tabel keranjang belanja
CREATE TABLE keranjang (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_produk INTEGER,
    jumlah INTEGER,
    FOREIGN KEY (id_produk) REFERENCES produk(id)
);