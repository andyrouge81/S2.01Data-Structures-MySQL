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



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
