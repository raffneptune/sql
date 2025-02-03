CREATE DATABASE payroll_system;
USE payroll_system;

-- Tabel untuk menyimpan data karyawan
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel untuk menyimpan data gaji
CREATE TABLE salaries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    basic_salary DOUBLE NOT NULL,
    allowance DOUBLE NOT NULL,
    deduction DOUBLE NOT NULL,
    total_salary DOUBLE NOT NULL,
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- Contoh data karyawan
INSERT INTO employees (name, position) VALUES
('Budi Santoso', 'Manager'),
('Ani Wijaya', 'Staff'),
('Joko Susilo', 'Supervisor');

-- Contoh data gaji
INSERT INTO salaries (employee_id, basic_salary, allowance, deduction, total_salary) VALUES
(1, 5000000, 1000000, 500000, 5500000),
(2, 3000000, 500000, 200000, 3300000),
(3, 4000000, 700000, 300000, 4400000);