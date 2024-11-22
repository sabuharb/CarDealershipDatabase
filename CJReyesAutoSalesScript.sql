DROP DATABASE IF EXISTS car_dealership;
CREATE DATABASE car_dealership;
USE car_dealership;

CREATE TABLE Dealerships (
DealershipID INTEGER NOT NULL AUTO_INCREMENT,
Name VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(12) NOT NULL,
PRIMARY KEY (DealershipID)
);

INSERT INTO Dealerships (dealership_id, name, address, phone)
VALUES
(NULL, 'CJ Reyes Auto Sales', '915 Mullins St', '972-456-6039'),
(NULL, 'Reyes Venta de Carros', '1001 W Sixth ST', '469-259-3432'),
(NULL, 'Safi Abu Harb Lote de Autos', '1111 W Airport Fwy', '214-752-3950');

CREATE TABLE Vehicles (
VIN VARCHAR(20) NOT NULL,
year INT NOT NUll,
make VARCHAR(50) NOT NULL,
model VARCHAR(50) NOT NULL,
vehicle_type VARCHAR(50) NOT NULL,
color VARCHAR(20) NOT NULL,
odometer INT NOT NULL,
price DECIMAL (10, 2) NOT NULL,
sold BOOLEAN NOT NULL,
PRIMARY KEY (VIN)
);

INSERT INTO Vehicles (VIN, year,make, model, vehicle_type, color, odometer, price, sold)
VALUES 
('8WZ2', '2005','Scion', 'TC', 'Coupe', 'Purple', 3500,3999.99, FALSE),
('2VQ1','2013', 'Toyota', 'RAV4', 'SUV', 'Blue',12000,13999.99, TRUE),
('5GH3', '2019', 'Honda', 'Civic', 'Sedan', 'Silver', 16000, 17999.99, TRUE);

CREATE TABLE Inventory (
inventory_id INT AUTO_INCREMENT,
dealership_id INT NOT  NULL,
VIN VARCHAR(20) NOT NULL,
PRIMARY KEY (inventory_id),
FOREIGN KEY ( dealership_id) REFERENCES Dealerships(dealersip_id),
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

INSERT INTO Inventory (inventory_id, dealership_id, VIN)
VALUES
(NULL, 1, '8WZ2'),
(NULL, 2, '2VQ1'),
(NULL, 3, '5GH3');

CREATE TABLE Sale_Contracts (
id INT AUTO_INCREMENT,
date_of_contract DATETIME,
customer_name VARCHAR(100) NOT NULL,
customer_email VARCHAR(100) NOT NULL,
VIN VARCHAR(20) NOT NULL,
original_price DECIMAL(10,2) NOT NULL,
financed BOOLEAN NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

INSERT INTO Sales_Contracts (id, date_of_Contract, customer_name, customer_email, VIN, original_price, financed)
VALUES
(NULL, '2024-10-07 16:15:23', 'Asali Pizzarali', 'asali.p@littleitaliapizzeria.com', '8WZ2', 3999.99, TRUE),
(NULL, '2024-11-11 09:50:12', 'Aldo Alvarez', 'alvarez.aldo@petkit.com', '2VQ1', 13999.99, TRUE),
(NULL, '2024-11-22 15:43:26', 'Minerva Shak' 'shak.mina90@gmail.com', '5GH3', 17999.99, FALSE);

 
