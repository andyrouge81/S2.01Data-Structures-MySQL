-- ===============================================
--  CLEAN SCRIPT - OPTIC DATABASE
-- ===============================================

DROP DATABASE IF EXISTS optic;
CREATE DATABASE optic CHARACTER SET utf8mb4;
USE optic;

-- 1️⃣ SUPPLIER
CREATE TABLE supplier (
  supplier_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(60),
  street VARCHAR(60),
  address_number INT,
  floor INT,
  door VARCHAR(15),
  city VARCHAR(45),
  zip_code VARCHAR(10),
  country VARCHAR(45),
  phone VARCHAR(20),
  fax VARCHAR(20),
  nif VARCHAR(20),
  PRIMARY KEY (supplier_id)
) ENGINE=InnoDB;

INSERT INTO supplier (name, street, address_number, floor, door, city, zip_code, country, phone, fax, nif)
VALUES
('VisionGlobal S.A.', 'Calle Sol', 12, 2, 'A', 'Madrid', '28013', 'España', '913223344', '913223345', 'B12345678'),
('OptiWorld Ltd.', 'Avenida Europa', 45, NULL, NULL, 'Barcelona', '08015', 'España', '932556677', '932556678', 'B87654321'),
('ClearView GmbH', 'Hauptstrasse', 9, 1, 'B', 'Berlin', '10115', 'Alemania', '4930123456', '4930123457', 'DE11223344');

-- 2️⃣ BRAND
CREATE TABLE brand (
  brand_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(60),
  supplier_supplier_id INT NOT NULL,
  PRIMARY KEY (brand_id),
  CONSTRAINT fk_brand_supplier FOREIGN KEY (supplier_supplier_id)
    REFERENCES supplier (supplier_id)
    ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO brand (name, supplier_supplier_id)
VALUES
('RayVision', 1),
('EcoEyes', 2),
('CrystalOptics', 3);

-- 3️⃣ GLASSES
CREATE TABLE glasses (
  glasses_id INT NOT NULL AUTO_INCREMENT,
  brand VARCHAR(60),
  lens_graduation DECIMAL(3,2),
  color_lens VARCHAR(45),
  glasses_frame ENUM('plastic','aluminium','policarbon') DEFAULT 'plastic',
  color_frame VARCHAR(45),
  price DECIMAL(7,2),
  supplier_supplier_id INT NOT NULL,
  brand_brand_id INT NOT NULL,
  PRIMARY KEY (glasses_id),
  CONSTRAINT fk_glasses_supplier FOREIGN KEY (supplier_supplier_id)
    REFERENCES supplier (supplier_id)
    ON UPDATE CASCADE,
  CONSTRAINT fk_glasses_brand FOREIGN KEY (brand_brand_id)
    REFERENCES brand (brand_id)
    ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO glasses (brand, lens_graduation, color_lens, glasses_frame, color_frame, price, supplier_supplier_id, brand_brand_id)
VALUES
('RayVision', 1.25, 'gris', 'plastic', 'negro', 89.90, 1, 1),
('EcoEyes', 2.50, 'marrón', 'aluminium', 'plateado', 120.50, 2, 2),
('CrystalOptics', 0.00, 'transparente', 'policarbon', 'azul', 59.99, 3, 3),
('RayVision', 1.75, 'verde', 'plastic', 'rojo', 95.00, 1, 1);

-- 4️⃣ CLIENTS
CREATE TABLE clients (
  client_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(60),
  address VARCHAR(100),
  phone VARCHAR(15),
  mail VARCHAR(55),
  registration_date DATE,
  recommended_client_id INT NULL,
  PRIMARY KEY (client_id),
  CONSTRAINT fk_clients_self FOREIGN KEY (recommended_client_id)
    REFERENCES clients (client_id)
    ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO clients (name, address, phone, mail, registration_date, recommended_client_id)
VALUES
('Laura García', 'Calle Luna 5, Madrid', '600123456', 'laura.garcia@email.com', '2025-01-12', NULL),
('Carlos Pérez', 'Av. del Prado 21, Madrid', '611987654', 'carlos.perez@email.com', '2025-02-20', 1),
('Marta Ruiz', 'C/ Mayor 7, Barcelona', '622654321', 'marta.ruiz@email.com', '2025-03-10', 2);

-- 5️⃣ SALE
CREATE TABLE sale (
  sale_id INT NOT NULL AUTO_INCREMENT,
  name_client VARCHAR(60),
  name_employee VARCHAR(60),
  registration_sell DATE,
  clients_client_id INT NOT NULL,
  glasses_glasses_id INT NOT NULL,
  PRIMARY KEY (sale_id),
  CONSTRAINT fk_sale_clients FOREIGN KEY (clients_client_id)
    REFERENCES clients (client_id)
    ON UPDATE CASCADE,
  CONSTRAINT fk_sale_glasses FOREIGN KEY (glasses_glasses_id)
    REFERENCES glasses (glasses_id)
    ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO sale (name_client, name_employee, registration_sell, clients_client_id, glasses_glasses_id)
VALUES
('Laura García', 'Javier López', '2025-03-01', 1, 1),
('Carlos Pérez', 'Sofía Díaz', '2025-03-15', 2, 2),
('Marta Ruiz', 'Javier López', '2025-03-20', 3, 4);

-- 6️⃣ EMPLOYEE
CREATE TABLE employee (
  employee_id INT NOT NULL AUTO_INCREMENT,
  name_employee VARCHAR(45),
  sale_sale_id INT NOT NULL,
  PRIMARY KEY (employee_id),
  CONSTRAINT fk_employee_sale FOREIGN KEY (sale_sale_id)
    REFERENCES sale (sale_id)
    ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO employee (name_employee, sale_sale_id)
VALUES
('Javier López', 1),
('Sofía Díaz', 2),
('Javier López', 3);
