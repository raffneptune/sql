CREATE DATABASE AbsensiDB;
USE AbsensiDB;

CREATE TABLE Siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50) NOT NULL
);

CREATE TABLE Absensi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    siswa_id INT,
    tanggal DATE NOT NULL,
    status ENUM('Hadir', 'Tidak Hadir', 'Status Tidak Valid') NOT NULL,
    FOREIGN KEY (siswa_id) REFERENCES Siswa(id)
);

-- Insert sample data
INSERT INTO Siswa (nama) VALUES ('Ali'), ('Budi'), ('Citra'), ('Dewi'), ('Eka');