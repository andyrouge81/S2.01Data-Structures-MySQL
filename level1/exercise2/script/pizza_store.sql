-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pizza_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizza_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizza_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `pizza_store` ;

-- -----------------------------------------------------
-- Table `pizza_store`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- CATEGORY
INSERT INTO category (name)
VALUES
('Pizza clásica'),
('Pizza gourmet'),
('Hamburguesa'),
('Bebida'),
('Complemento'),
('Postre'),
('Vegana'),
('Sin gluten'),
('Infantil'),
('Especial de temporada');

-- -----------------------------------------------------
-- Table `pizza_store`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`province` (
  `province_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`province_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO province (name)
VALUES
('Madrid'),
('Barcelona'),
('Valencia'),
('Sevilla'),
('Bilbao'),
('Zaragoza'),
('Málaga'),
('Murcia'),
('Valladolid'),
('Alicante');

-- -----------------------------------------------------
-- Table `pizza_store`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`city` (
  `city_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `province_id` INT NOT NULL,
  PRIMARY KEY (`city_id`),
  INDEX `province_id` (`province_id` ASC) VISIBLE,
  CONSTRAINT `city_ibfk_1`
    FOREIGN KEY (`province_id`)
    REFERENCES `pizza_store`.`province` (`province_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO city (name, province_id)
VALUES
('Madrid', 1),
('Alcalá de Henares', 1),
('Barcelona', 2),
('Badalona', 2),
('Valencia', 3),
('Torrent', 3),
('Sevilla', 4),
('Dos Hermanas', 4),
('Bilbao', 5),
('Santurce', 5);

-- -----------------------------------------------------
-- Table `pizza_store`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `zip_code` VARCHAR(10) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `city_id` (`city_id` ASC) VISIBLE,
  CONSTRAINT `client_ibfk_1`
    FOREIGN KEY (`city_id`)
    REFERENCES `pizza_store`.`city` (`city_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO client (name, surname, address, zip_code, phone, city_id)
VALUES
('Carlos', 'López', 'Calle Mayor 12', '28013', '600111222', 1),
('María', 'Gómez', 'Av. Cataluña 3', '28805', '600222333', 2),
('Javier', 'Martín', 'C/ Mallorca 50', '08029', '600333444', 3),
('Lucía', 'Pérez', 'C/ Mar 10', '08912', '600444555', 4),
('Ana', 'Ruiz', 'Av. del Puerto 22', '46021', '600555666', 5),
('Sergio', 'Fernández', 'C/ Cervantes 8', '46900', '600666777', 6),
('Laura', 'Torres', 'C/ Feria 4', '41003', '600777888', 7),
('Raúl', 'Díaz', 'C/ Sol 15', '41700', '600888999', 8),
('Patricia', 'Santos', 'C/ Iparraguirre 9', '48010', '600999000', 9),
('Miguel', 'Vega', 'C/ Portugalete 6', '48980', '601000111', 10);

-- -----------------------------------------------------
-- Table `pizza_store`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`store` (
  `store_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NOT NULL,
  `zip_code` VARCHAR(10) NULL DEFAULT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`store_id`),
  INDEX `city_id` (`city_id` ASC) VISIBLE,
  CONSTRAINT `store_ibfk_1`
    FOREIGN KEY (`city_id`)
    REFERENCES `pizza_store`.`city` (`city_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO store (address, zip_code, city_id)
VALUES
('C/ Atocha 45', '28012', 1),
('C/ Marina 8', '08025', 3),
('Av. del Puerto 100', '46022', 5),
('C/ Sierpes 14', '41004', 7),
('C/ Gran Vía 22', '48001', 9),
('C/ Independencia 9', '50008', 6),
('C/ Larios 15', '29005', 7),
('C/ Salzillo 7', '30001', 8),
('C/ Constitución 11', '47001', 9),
('C/ Maisonnave 5', '03003', 10);

-- -----------------------------------------------------
-- Table `pizza_store`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `store_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(100) NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `role` ENUM('cooker', 'rider') NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE INDEX `nif` (`nif` ASC) VISIBLE,
  INDEX `store_id` (`store_id` ASC) VISIBLE,
  CONSTRAINT `employee_ibfk_1`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizza_store`.`store` (`store_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO employee (store_id, name, surname, nif, phone, role)
VALUES
(1, 'Pedro', 'Sanz', '12345678A', '611111111', 'cooker'),
(1, 'David', 'Morales', '12345679B', '611111112', 'rider'),
(2, 'Elena', 'Ramos', '12345680C', '611111113', 'cooker'),
(2, 'Alberto', 'Iglesias', '12345681D', '611111114', 'rider'),
(3, 'Rosa', 'Navarro', '12345682E', '611111115', 'cooker'),
(3, 'Hugo', 'Serrano', '12345683F', '611111116', 'rider'),
(4, 'Marta', 'Prieto', '12345684G', '611111117', 'cooker'),
(4, 'Jorge', 'Luna', '12345685H', '611111118', 'rider'),
(5, 'Nerea', 'Campos', '12345686I', '611111119', 'cooker'),
(5, 'Luis', 'Mendoza', '12345687J', '611111120', 'rider');

-- -----------------------------------------------------
-- Table `pizza_store`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`orders` (
  `orders_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `store_id` INT NOT NULL,
  `rider_id` INT NULL DEFAULT NULL,
  `order_type` ENUM('delivery', 'pickup') NOT NULL,
  `registration_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `delivery_date` TIMESTAMP NULL DEFAULT NULL,
  `total_price` DECIMAL(8,2) NULL DEFAULT '0.00',
  `employee_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  INDEX `client_id` (`client_id` ASC) VISIBLE,
  INDEX `store_id` (`store_id` ASC) VISIBLE,
  INDEX `rider_id` (`rider_id` ASC) VISIBLE,
  INDEX `fk_order_employee` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `pizza_store`.`employee` (`employee_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `pizza_store`.`client` (`client_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`store_id`)
    REFERENCES `pizza_store`.`store` (`store_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_3`
    FOREIGN KEY (`rider_id`)
    REFERENCES `pizza_store`.`employee` (`employee_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO orders (client_id, store_id, rider_id, order_type, delivery_date, total_price, employee_id)
VALUES
(1, 1, 2, 'delivery', '2025-11-03 21:00:00', 20.50, 1),
(2, 1, NULL, 'pickup', '2025-11-02 20:00:00', 12.00, 1),
(3, 2, 4, 'delivery', '2025-11-01 19:30:00', 18.00, 3),
(4, 3, 6, 'delivery', '2025-11-03 21:15:00', 23.50, 5),
(5, 3, NULL, 'pickup', '2025-11-03 18:45:00', 15.00, 5),
(6, 4, 8, 'delivery', '2025-11-02 22:00:00', 19.00, 7),
(7, 4, NULL, 'pickup', '2025-11-01 20:15:00', 9.00, 7),
(8, 5, 10, 'delivery', '2025-11-03 22:00:00', 22.00, 9),
(9, 5, NULL, 'pickup', '2025-11-02 21:30:00', 11.50, 9),
(10, 1, 2, 'delivery', '2025-11-03 21:45:00', 24.00, 1);


-- -----------------------------------------------------
-- Table `pizza_store`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `price` DECIMAL(6,2) NOT NULL,
  `category_id` INT NULL DEFAULT NULL,
  `type` ENUM('pizza', 'hamburger', 'drink') NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `category_id` (`category_id` ASC) VISIBLE,
  CONSTRAINT `product_ibfk_1`
    FOREIGN KEY (`category_id`)
    REFERENCES `pizza_store`.`category` (`category_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO product (name, description, image, price, category_id, type)
VALUES
('Pizza Margarita', 'Tomate, mozzarella y albahaca fresca', 'margarita.jpg', 8.50, 1, 'pizza'),
('Pizza Barbacoa', 'Carne, cebolla y salsa barbacoa', 'barbacoa.jpg', 10.50, 1, 'pizza'),
('Pizza 4 Quesos', 'Mozzarella, gorgonzola, parmesano y emmental', '4quesos.jpg', 9.90, 2, 'pizza'),
('Hamburguesa Clásica', 'Carne de vacuno con lechuga, tomate y queso', 'hamburguesa.jpg', 7.50, 3, 'hamburger'),
('Hamburguesa Vegana', 'Soja, aguacate y pan integral', 'vegana.jpg', 8.00, 7, 'hamburger'),
('Coca-Cola', 'Refresco de cola 33cl', 'cocacola.jpg', 2.00, 4, 'drink'),
('Agua Mineral', 'Agua natural embotellada 50cl', 'agua.jpg', 1.50, 4, 'drink'),
('Pan de Ajo', 'Pan horneado con mantequilla y ajo', 'panajo.jpg', 3.00, 5, 'pizza'),
('Tiramisú', 'Postre italiano con mascarpone y cacao', 'tiramisu.jpg', 4.50, 6, 'pizza'),
('Pizza Pepperoni', 'Mozzarella, tomate y pepperoni', 'pepperoni.jpg', 9.50, 1, 'pizza');




-- -----------------------------------------------------
-- Table `pizza_store`.`orders_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_store`.`orders_product` (
  `orders_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT '1',
  PRIMARY KEY (`orders_id`, `product_id`),
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `orders_product_ibfk_1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `pizza_store`.`orders` (`orders_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `orders_product_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `pizza_store`.`product` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO orders_product (orders_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 6, 2),
(2, 2, 1),
(3, 4, 2),
(4, 3, 1),
(4, 9, 1),
(5, 10, 1),
(6, 5, 2),
(7, 8, 1),
(8, 1, 1),
(8, 7, 1),
(9, 2, 1),
(10, 3, 1),
(10, 6, 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
