-- Membuat tabel parkir untuk menyimpan informasi kendaraan
CREATE TABLE kendaraan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT NOT NULL
);

-- Menambahkan beberapa data kendaraan contoh ke dalam tabel
INSERT INTO kendaraan (nama) VALUES ('Mobil A');
INSERT INTO kendaraan (nama) VALUES ('Motor B');
INSERT INTO kendaraan (nama) VALUES ('Mobil C');