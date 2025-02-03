-- Membuat tabel pelanggan
CREATE TABLE pelanggan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL
);

-- Membuat tabel antrian
CREATE TABLE antrian (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pelanggan_id INT NOT NULL,
    waktu_berangkat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id)
);

-- Membuat tabel status barbershop
CREATE TABLE status_barbershop (
    id INT PRIMARY KEY,
    buka BOOLEAN NOT NULL
);

-- Menambahkan status awal barbershop (buka)
INSERT INTO status_barbershop (id, buka) VALUES (1, TRUE);

-- Menambahkan beberapa pelanggan sebagai contoh
INSERT INTO pelanggan (nama) VALUES ('John Doe');
INSERT INTO pelanggan (nama) VALUES ('Jane Smith');
INSERT INTO pelanggan (nama) VALUES ('Alice Brown');
INSERT INTO pelanggan (nama) VALUES ('Bob Johnson');

-- Menambahkan pelanggan ke dalam antrian
INSERT INTO antrian (pelanggan_id) VALUES (1);
INSERT INTO antrian (pelanggan_id) VALUES (2);
INSERT INTO antrian (pelanggan_id) VALUES (3);
INSERT INTO antrian (pelanggan_id) VALUES (4);