DROP DATABASE IF EXISTS cruddb1;
CREATE DATABASE cruddb1;

\c cruddb1;

DROP TABLE IF EXISTS student;
CREATE TABLE student(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    mobile VARCHAR(10) NOT NULL
);

INSERT INTO student (name, email, mobile) VALUES
('Amit Sharma',   'amit.sharma@gmail.com',   '9876543210'),
('Neha Verma',    'neha.verma@gmail.com',    '9876543211'),
('Rahul Patil',   'rahul.patil@gmail.com',   '9876543212'),
('Priya Singh',   'priya.singh@gmail.com',   '9876543213'),
('Kunal Mehta',   'kunal.mehta@gmail.com',   '9876543214'),
('Sneha Joshi',   'sneha.joshi@gmail.com',   '9876543215'),
('Rohit Kulkarni','rohit.k@gmail.com',       '9876543216'),
('Pooja Nair',    'pooja.nair@gmail.com',    '9876543217'),
('Vikas Rao',     'vikas.rao@gmail.com',     '9876543218'),
('Anjali Deshmukh','anjali.d@gmail.com',     '9876543219');

SELECT * FROM student;

INSERT INTO users (full_name, username, password) VALUES
('Admin User', 'admin', 'e10adc3949ba59abbe56e057f20f883e'),
('Gaurav Kadam', 'gaurav', 'e10adc3949ba59abbe56e057f20f883e'),
('Rohit Sharma', 'rohit', 'e10adc3949ba59abbe56e057f20f883e'),
('Anita Deshmukh', 'anita', 'e10adc3949ba59abbe56e057f20f883e'),
('System User', 'system', 'e10adc3949ba59abbe56e057f20f883e');

SELECT id, full_name, username, created_at FROM users;