-- Membuat database TicTacToe
CREATE DATABASE TicTacToe;

-- Menggunakan database TicTacToe
USE TicTacToe;

-- Membuat tabel untuk menyimpan permainan
CREATE TABLE games (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    board VARCHAR(9) NOT NULL,
    current_player CHAR(1) NOT NULL,
    winner CHAR(1),
    is_draw BOOLEAN DEFAULT FALSE,
    game_status ENUM('ongoing', 'completed') DEFAULT 'ongoing',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Contoh untuk menyimpan data permainan (insert ke dalam tabel games)
-- Misalnya permainan yang sedang berlangsung
INSERT INTO games (board, current_player)
VALUES ('XOX OXOX ', 'X');

-- Jika permainan selesai dan pemain X menang
UPDATE games
SET winner = 'X', game_status = 'completed', updated_at = CURRENT_TIMESTAMP
WHERE game_id = 1;

-- Contoh untuk menyimpan data permainan berakhir seri
INSERT INTO games (board, current_player, is_draw)
VALUES ('XOXOXOXOX', 'O', TRUE);