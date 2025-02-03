-- Membuat tabel buku
CREATE TABLE buku (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    judul TEXT NOT NULL,
    penulis TEXT NOT NULL,
    tahun_terbit INTEGER NOT NULL
);

-- Menambahkan contoh data buku ke dalam tabel
INSERT INTO buku (judul, penulis, tahun_terbit) VALUES ('Belajar Python', 'John Doe', 2021);
INSERT INTO buku (judul, penulis, tahun_terbit) VALUES ('Data Science untuk Pemula', 'Jane Smith', 2020);
INSERT INTO buku (judul, penulis, tahun_terbit) VALUES ('Algoritma dan Pemrograman', 'Robert Brown', 2019);