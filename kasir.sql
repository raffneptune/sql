-- Membuat tabel untuk menyimpan informasi barang
CREATE TABLE barang (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT NOT NULL,
    harga REAL NOT NULL
);

-- Membuat tabel untuk menyimpan transaksi yang terjadi
CREATE TABLE transaksi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tanggal DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_harga REAL NOT NULL,
    uang_dibayar REAL NOT NULL,
    kembalian REAL NOT NULL
);

-- Menambahkan beberapa barang contoh ke dalam tabel barang
INSERT INTO barang (nama, harga) VALUES ('Apel', 10000);
INSERT INTO barang (nama, harga) VALUES ('Pisang', 8000);
INSERT INTO barang (nama, harga) VALUES ('Jeruk', 12000);
INSERT INTO barang (nama, harga) VALUES ('Mangga', 15000);
INSERT INTO barang (nama, harga) VALUES ('Semangka', 20000);