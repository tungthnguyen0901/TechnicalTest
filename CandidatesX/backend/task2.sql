DROP DATABASE IF EXISTS CinemaDB;

CREATE DATABASE CinemaDB;

USE CinemaDB;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Studio (
    studio_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE Seat (
    seat_id INT PRIMARY KEY,
    studio_id INT NOT NULL,
    row CHAR(1) NOT NULL,
    number INT NOT NULL,
    is_reserved BOOLEAN DEFAULT FALSE,
    reserved_at TIMESTAMP NULL,
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);

CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    studio_id INT NOT NULL,
    booking_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);

CREATE TABLE BookingDetails (
    booking_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    seat_id INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);

-- Initial Data

INSERT INTO Studio (name, capacity, location) VALUES
('studio A', 100, 'Building 1, 2nd Floor'),
('studio B', 150, 'Building 1, 3rd Floor');

INSERT INTO Seat (seat_id, studio_id, row, number, is_reserved) VALUES
(1, 1, 'A', 1, FALSE),
(2, 1, 'A', 2, FALSE),
(3, 1, 'A', 3, FALSE),
(4, 1, 'A', 4, FALSE),
(5, 1, 'A', 5, FALSE),
(6, 1, 'B', 1, FALSE),
(7, 1, 'B', 2, FALSE),
(8, 1, 'B', 3, FALSE),
(9, 2, 'A', 1, FALSE),
(10, 2, 'A', 2, FALSE);

INSERT INTO Customer (name, email, phone) VALUES
('John Doe', 'john@example.com', '123456789'),
('Jane Smith', 'jane@example.com', '987654321'),
('Alice Johnson', 'alice@example.com', '555555555');

INSERT INTO Booking (customer_id, studio_id, booking_date) VALUES
(1, 1, '2024-12-05'),
(2, 1, '2024-12-06'),
(3, 2, '2024-12-05');

INSERT INTO BookingDetails (booking_id, seat_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), 
(2, 5), (2, 6),                 
(3, 9), (3, 10);                 

