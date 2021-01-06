-- MySQL Script generated by MySQL Workbench
-- Tue Jan  5 16:45:15 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 ;
USE `shop` ;

-- -----------------------------------------------------
-- Table `shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`category` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`category` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `shop`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`user` (
  `id` VARCHAR(36) NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `isseller` VARCHAR(1) NOT NULL DEFAULT 0,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `shop`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`manager` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`shop`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`shop` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `status` CHAR NOT NULL DEFAULT '0',
  `address` VARCHAR(255) NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `manager_id` VARCHAR(36) NOT NULL,
  `category_id` VARCHAR(36) NOT NULL,
  `describe` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_store_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_store_manager1_idx` (`manager_id` ASC) VISIBLE,
  INDEX `fk_shop_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_store_manager1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `shop`.`manager` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shop_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `shop`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`goods` (
  `id` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `name` VARCHAR(16) NOT NULL,
  `count` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shop_id` INT NOT NULL,
  `status` CHAR NOT NULL DEFAULT '0',
  `describe` VARCHAR(255) NULL,
  `category_id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_goods_shop1_idx` (`shop_id` ASC) VISIBLE,
  INDEX `fk_goods_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_goods_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `shop`.`shop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `shop`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `shop`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`order` (
  `id` VARCHAR(36) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `goods_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_order_goods1_idx` (`goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`cart` (
  `id` VARCHAR(36) NOT NULL,
  `goods_id` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(36) NOT NULL,
  `count` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cart_goods1_idx` (`goods_id` ASC) VISIBLE,
  INDEX `fk_cart_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`shop_goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`shop_goods` (
  `id` VARCHAR(45) NOT NULL,
  `goods_id` VARCHAR(45) NOT NULL,
  `shop_id` INT NOT NULL,
  INDEX `fk_store_goods_goods1_idx` (`goods_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_shop_goods_shop1_idx` (`shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_goods_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shop_goods_shop1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `shop`.`shop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`img` (
  `id` INT NOT NULL,
  `img1` VARCHAR(255) NULL,
  `img2` VARCHAR(255) NULL,
  `img3` VARCHAR(255) NULL,
  `img4` VARCHAR(255) NULL,
  `img5` VARCHAR(255) NULL,
  `img6` VARCHAR(255) NULL,
  `goods_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_img_goods1_idx` (`goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_img_goods1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `shop`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`address` (
  `id` VARCHAR(45) NOT NULL,
  `address1` VARCHAR(255) NULL,
  `address2` VARCHAR(255) NULL,
  `address3` VARCHAR(255) NULL,
  `address4` VARCHAR(255) NULL,
  `address5` VARCHAR(255) NULL,
  `address6` VARCHAR(255) NULL,
  `user_id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `shop`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
