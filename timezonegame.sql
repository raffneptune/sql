-- Membuat database TimezoneMall
CREATE DATABASE TimezoneMall;

-- Menggunakan database TimezoneMall
USE TimezoneMall;

-- Membuat tabel untuk menyimpan data pengguna
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) UNIQUE NOT NULL,
    kredit INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Membuat tabel untuk menyimpan riwayat permainan
CREATE TABLE game_history (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    game_name VARCHAR(255),
    result ENUM('Menang', 'Kalah') NOT NULL,
    played_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Contoh untuk menambahkan pengguna
-- Misalnya pengguna baru bernama 'john_doe'
INSERT INTO users (user_name, kredit)
VALUES ('john_doe', 10);

-- Contoh untuk menambahkan riwayat permainan
-- Misalnya pengguna 'john_doe' memainkan 'Pac-Man' dan menang
-- Pertama, kita ambil user_id dari 'john_doe'
SELECT user_id FROM users WHERE user_name = 'john_doe';

-- Kemudian kita masukkan riwayat permainan ke tabel game_history
INSERT INTO game_history (user_id, game_name, result)
VALUES (1, 'Pac-Man', 'Menang');

-- Jika pengguna membeli kredit
UPDATE users
SET kredit = kredit + 5
WHERE user_name = 'john_doe';

-- Contoh untuk mengambil saldo kredit pengguna
SELECT kredit FROM users WHERE user_name = 'john_doe';

-- Menampilkan riwayat permainan
SELECT game_name, result, played_at
FROM game_history
JOIN users ON game_history.user_id = users.user_id
WHERE user_name = 'john_doe';