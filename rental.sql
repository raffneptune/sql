-- Membuat tabel barang (items)
CREATE TABLE barang (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT NOT NULL,
    tarif_per_jam INTEGER NOT NULL
);

-- Memasukkan data barang ke dalam tabel
INSERT INTO barang (nama, tarif_per_jam) VALUES ('Sepeda', 5000);
INSERT INTO barang (nama, tarif_per_jam) VALUES ('Skuter', 10000);
INSERT INTO barang (nama, tarif_per_jam) VALUES ('Mobil', 50000);

-- Membuat tabel transaksi
CREATE TABLE transaksi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_barang INTEGER,
    jam INTEGER,
    total_biaya INTEGER,
    tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_barang) REFERENCES barang(id)
);