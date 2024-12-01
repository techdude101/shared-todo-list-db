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
-- Table `db_todo`.`tbl_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_todo`.`tbl_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `db_todo`.`tbl_todo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_todo`.`tbl_todo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `todo_id` INT UNSIGNED NOT NULL,
  `data` VARCHAR(100) NULL,
  `completed` TINYINT NULL,
  `completed_timestamp` TIMESTAMP NULL,
  `tbl_user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tbl_user_id`),
  UNIQUE INDEX `idtable1_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_tbl_todos_tbl_user_idx` (`tbl_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_todos_tbl_user`
    FOREIGN KEY (`tbl_user_id`)
    REFERENCES `db_todo`.`tbl_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
