-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_todo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_todo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_todo` DEFAULT CHARACTER SET utf8 ;
USE `db_todo` ;

-- -----------------------------------------------------
-- Table `db_todo`.`tbl_todo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_todo`.`tbl_todo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `todo_id` INT UNSIGNED NOT NULL,
  `data` VARCHAR(100) NULL,
  `completed` TINYINT NULL,
  `completed_timestamp` INT UNSIGNED NULL,
  PRIMARY KEY (`id`, `user_id`),
  UNIQUE INDEX `idtable1_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
