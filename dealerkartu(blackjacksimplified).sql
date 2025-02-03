CREATE DATABASE card_game;
USE card_game;

-- Tabel untuk menyimpan informasi pemain
CREATE TABLE players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel untuk menyimpan informasi permainan
CREATE TABLE games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT,
    dealer_hand VARCHAR(255),
    player_hand VARCHAR(255),
    result ENUM('win', 'lose', 'draw') NOT NULL,
    played_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE
);

-- Tabel untuk menyimpan deck kartu
CREATE TABLE deck (
    id INT AUTO_INCREMENT PRIMARY KEY,
    card_value VARCHAR(5) NOT NULL
);

-- Memasukkan daftar kartu ke dalam deck
INSERT INTO deck (card_value) VALUES
('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9'), ('10'), ('J'), ('Q'), ('K'), ('A');