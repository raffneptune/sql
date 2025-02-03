CREATE DATABASE vehicle_dealer;
USE vehicle_dealer;

-- Tabel untuk menyimpan informasi kendaraan
CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel untuk menyimpan transaksi pembelian
CREATE TABLE purchases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    quantity INT NOT NULL,
    total_price INT NOT NULL,
    purchased_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON DELETE CASCADE
);

-- Menambahkan beberapa kendaraan ke dalam tabel
INSERT INTO vehicles (model, price, stock) VALUES
('Mobil Sedan', 300000000, 10),
('Motor Sport', 100000000, 5),
('Mobil SUV', 500000000, 3);