-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optic` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema optic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `optic` ;

-- -----------------------------------------------------
-- Table `optic`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optic`.`address` (
  `address_id` INT NOT NULL,
  `street` VARCHAR(60) NULL,
  `number` VARCHAR(45) NULL,
  `floor` VARCHAR(15) NULL,
  `door` INT(4) NULL,
  `city` VARCHAR(45) NULL,
  `zip_code` VARCHAR(10) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;

USE `optic` ;

-- -----------------------------------------------------
-- Table `optic`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optic`.`client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NULL DEFAULT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(15) NULL DEFAULT NULL,
  `mail` VARCHAR(55) NULL DEFAULT NULL,
  `registration_date` DATE NULL DEFAULT NULL,
  `recommended_client_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  INDEX `fk_clients_self` (`recommended_client_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_self`
    FOREIGN KEY (`recommended_client_id`)
    REFERENCES `optic`.`client` (`client_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optic`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optic`.`supplier` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `fax` VARCHAR(20) NULL DEFAULT NULL,
  `nif` VARCHAR(20) NULL DEFAULT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`supplier_id`),
  INDEX `fk_supplier_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_supplier_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `optic`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optic`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optic`.`glasses` (
  `glasses_id` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(60) NULL DEFAULT NULL,
  `lens_graduation` DECIMAL(3,2) NULL DEFAULT NULL,
  `color_lens` VARCHAR(45) NULL DEFAULT NULL,
  `glasses_frame` ENUM('plastic', 'aluminium', 'policarbon') NULL DEFAULT 'plastic',
  `color_frame` VARCHAR(45) NULL DEFAULT NULL,
  `price` DECIMAL(7,2) NULL DEFAULT NULL,
  `supplier_id` INT NOT NULL,
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_glasses_supplier` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_supplier`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `optic`.`supplier` (`supplier_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optic`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optic`.`sale` (
  `sale_id` INT NOT NULL AUTO_INCREMENT,
  `name_client` VARCHAR(60) NULL DEFAULT NULL,
  `name_employee` VARCHAR(60) NULL DEFAULT NULL,
  `registration_sale` VARCHAR(20) NULL DEFAULT NULL,
  `clients_id` INT NOT NULL,
  `glasses_id` INT NOT NULL,
  PRIMARY KEY (`sale_id`),
  INDEX `fk_sale_clients` (`clients_id` ASC) VISIBLE,
  INDEX `fk_sale_glasses` (`glasses_id` ASC) VISIBLE,
  CONSTRAINT `fk_sale_clients`
    FOREIGN KEY (`clients_id`)
    REFERENCES `optic`.`client` (`client_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_glasses`
    FOREIGN KEY (`glasses_id`)
    REFERENCES `optic`.`glasses` (`glasses_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optic`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optic`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `name_employee` VARCHAR(45) NULL DEFAULT NULL,
  `sale_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_sale` (`sale_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_sale`
    FOREIGN KEY (`sale_id`)
    REFERENCES `optic`.`sale` (`sale_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
