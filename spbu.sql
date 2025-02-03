-- Membuat tabel bahan bakar
CREATE TABLE bahan_bakar (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama_bahan_bakar TEXT NOT NULL,
    harga_per_liter INTEGER NOT NULL
);

-- Memasukkan data bahan bakar ke dalam tabel
INSERT INTO bahan_bakar (nama_bahan_bakar, harga_per_liter) VALUES ('Premium', 10000);
INSERT INTO bahan_bakar (nama_bahan_bakar, harga_per_liter) VALUES ('Pertalite', 12000);
INSERT INTO bahan_bakar (nama_bahan_bakar, harga_per_liter) VALUES ('Pertamax', 15000);

-- Membuat tabel transaksi
CREATE TABLE transaksi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_bahan_bakar INTEGER,
    jumlah_liter REAL,
    total_pembayaran INTEGER,
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_bahan_bakar) REFERENCES bahan_bakar(id)
);