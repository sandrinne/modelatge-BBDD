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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`provider` (
  `idprovider` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(255) NULL,
  `phone` FLOAT NULL,
  `fax` FLOAT NULL,
  `nif` VARCHAR(9) NULL,
  PRIMARY KEY (`idprovider`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`brands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`brands` (
  `idbrands` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `provider_idprovider` INT NOT NULL,
  PRIMARY KEY (`idbrands`),
  INDEX `fk_brands_provider1_idx` (`provider_idprovider` ASC) VISIBLE,
  CONSTRAINT `fk_brands_provider1`
    FOREIGN KEY (`provider_idprovider`)
    REFERENCES `mydb`.`provider` (`idprovider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `idcustomers` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `date` TIMESTAMP NULL,
  `name other customer` VARCHAR(45) NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Purchase` (
  `idPurchase` INT NOT NULL,
  `Seller` VARCHAR(45) NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`idPurchase`),
  INDEX `fk_Purchase_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  CONSTRAINT `fk_Purchase_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `mydb`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`glasses` (
  `idglasses` INT NOT NULL,
  `graduation` VARCHAR(45) NULL,
  `frames` VARCHAR(255) NULL,
  `color` VARCHAR(45) NULL,
  `price` FLOAT NULL,
  `brands_idbrands` INT NOT NULL,
  `provider_idprovider` INT NOT NULL,
  `Purchase_idPurchase` INT NOT NULL,
  PRIMARY KEY (`idglasses`),
  INDEX `fk_glasses_brands_idx` (`brands_idbrands` ASC) VISIBLE,
  INDEX `fk_glasses_provider1_idx` (`provider_idprovider` ASC) VISIBLE,
  INDEX `fk_glasses_Purchase1_idx` (`Purchase_idPurchase` ASC) VISIBLE,
  CONSTRAINT `fk_glasses_brands`
    FOREIGN KEY (`brands_idbrands`)
    REFERENCES `mydb`.`brands` (`idbrands`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_glasses_provider1`
    FOREIGN KEY (`provider_idprovider`)
    REFERENCES `mydb`.`provider` (`idprovider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_glasses_Purchase1`
    FOREIGN KEY (`Purchase_idPurchase`)
    REFERENCES `mydb`.`Purchase` (`idPurchase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
