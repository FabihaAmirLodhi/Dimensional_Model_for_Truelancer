-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dimensional
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dimensional
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dimensional` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dimensional` ;

-- -----------------------------------------------------
-- Table `dimensional`.`Freelancer_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dimensional`.`Freelancer_Dimension` (
  `Freelancer_ID` INT NOT NULL AUTO_INCREMENT,
  `Freelancer_First_Name` VARCHAR(45) NOT NULL,
  `Freelancer_Last_Name` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Endorsement` INT NULL,
  `Education` VARCHAR(100) NULL,
  `Work_Experience` VARCHAR(200) NULL,
  `About_me` VARCHAR(200) NULL,
  `Expertise_1` VARCHAR(50) NOT NULL,
  `Expertise_2` VARCHAR(50) NOT NULL,
  `Expertise_3` VARCHAR(50) NULL,
  PRIMARY KEY (`Freelancer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dimensional`.`Client_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dimensional`.`Client_Dimension` (
  `Client_ID` INT NOT NULL AUTO_INCREMENT,
  `Client_First_Name` VARCHAR(20) NOT NULL,
  `Client_Last_Name` VARCHAR(20) NOT NULL,
  `Client_Email` VARCHAR(50) NOT NULL,
  `Client_Phone` VARCHAR(12) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Client_ID`),
  UNIQUE INDEX `Client_Email_UNIQUE` (`Client_Email` ASC) VISIBLE,
  UNIQUE INDEX `Client_Phone_UNIQUE` (`Client_Phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dimensional`.`Projects_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dimensional`.`Projects_Dimension` (
  `Project_ID` INT NOT NULL AUTO_INCREMENT,
  `Project_category` VARCHAR(45) NOT NULL,
  `Project_Detail` VARCHAR(200) NOT NULL,
  `Projects_Type` VARCHAR(15) NOT NULL,
  `Skill_req1` VARCHAR(70) NOT NULL,
  `Skill_req2` VARCHAR(70) NULL,
  `Skill_req3` VARCHAR(70) NULL,
  PRIMARY KEY (`Project_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dimensional`.`Bidding_Time_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dimensional`.`Bidding_Time_Dimension` (
  `Date_ID` INT NOT NULL AUTO_INCREMENT,
  `Bidding_Date` DATE NOT NULL,
  `Day_of_week` VARCHAR(45) NOT NULL,
  `Month` VARCHAR(45) NOT NULL,
  `Year` VARCHAR(45) NOT NULL,
  `Quarter` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Date_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dimensional`.`Bidding_Fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dimensional`.`Bidding_Fact` (
  `Bid_Amount` INT NOT NULL,
  `Payment_time` VARCHAR(10) NOT NULL,
  `Freelancer_Dimension_Freelancer_ID` INT NOT NULL,
  `Client_Dimension_Client_ID` INT NOT NULL,
  `Date_Time_Dimension_Date_ID` INT NOT NULL,
  `Projects_Dimension_Project_ID` INT NOT NULL,
  PRIMARY KEY (`Projects_Dimension_Project_ID`, `Date_Time_Dimension_Date_ID`, `Freelancer_Dimension_Freelancer_ID`, `Client_Dimension_Client_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dimensional`.`Review_Time_Dimension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dimensional`.`Review_Time_Dimension` (
  `Date_ID` INT NOT NULL AUTO_INCREMENT,
  `Review_Date` DATE NOT NULL,
  `Day_of_week` VARCHAR(45) NOT NULL,
  `Month` VARCHAR(45) NOT NULL,
  `Year` VARCHAR(45) NOT NULL,
  `Quarter` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Date_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dimensional`.`Review_Fact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dimensional`.`Review_Fact` (
  `Stars` INT NOT NULL,
  `Projects_Dimension_Project_ID` INT NOT NULL,
  `Freelancer_Dimension_Freelancer_ID` INT NOT NULL,
  `Client_Dimension_Client_ID` INT NOT NULL,
  `Review_Time_Dimension_Date_ID` INT NOT NULL,
  PRIMARY KEY (`Projects_Dimension_Project_ID`, `Freelancer_Dimension_Freelancer_ID`, `Client_Dimension_Client_ID`, `Review_Time_Dimension_Date_ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
