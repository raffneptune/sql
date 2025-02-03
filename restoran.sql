-- Membuat tabel menu
CREATE TABLE menu (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nama TEXT NOT NULL,
    harga INTEGER NOT NULL
);

-- Memasukkan data menu ke dalam tabel
INSERT INTO menu (nama, harga) VALUES ('Nasi Goreng', 25000);
INSERT INTO menu (nama, harga) VALUES ('Mie Goreng', 20000);
INSERT INTO menu (nama, harga) VALUES ('Sate Ayam', 30000);
INSERT INTO menu (nama, harga) VALUES ('Ayam Penyet', 35000);
INSERT INTO menu (nama, harga) VALUES ('Es Teh', 5000);
INSERT INTO menu (nama, harga) VALUES ('Es Jeruk', 7000);

-- Membuat tabel pesanan
CREATE TABLE pesanan (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_menu INTEGER,
    jumlah INTEGER,
    FOREIGN KEY (id_menu) REFERENCES menu(id)
);