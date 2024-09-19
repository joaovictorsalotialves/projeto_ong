-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projeto_ong
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto_ong
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto_ong` DEFAULT CHARACTER SET utf8 ;
USE `projeto_ong` ;

-- -----------------------------------------------------
-- Table `projeto_ong`.`States`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`States` (
  `idState` INT NOT NULL AUTO_INCREMENT,
  `nameState` VARCHAR(50) NULL,
  `UF` CHAR(2) NULL,
  PRIMARY KEY (`idState`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Cities` (
  `idCity` INT NOT NULL AUTO_INCREMENT,
  `nameCity` VARCHAR(100) NULL,
  `States_idState` INT NOT NULL,
  PRIMARY KEY (`idCity`),
  INDEX `fk_Cities_States1_idx` (`States_idState` ASC) VISIBLE,
  CONSTRAINT `fk_Cities_States1`
    FOREIGN KEY (`States_idState`)
    REFERENCES `projeto_ong`.`States` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Addresses` (
  `idAddress` INT NOT NULL AUTO_INCREMENT,
  `publicPlace` VARCHAR(100) NULL,
  `neigborhood` VARCHAR(50) NULL,
  `number` VARCHAR(10) NULL,
  `complement` VARCHAR(50) NULL,
  `States_idState` INT NOT NULL,
  `Cities_idCity` INT NOT NULL,
  PRIMARY KEY (`idAddress`),
  INDEX `fk_Addresses_States1_idx` (`States_idState` ASC) VISIBLE,
  INDEX `fk_Addresses_Cities1_idx` (`Cities_idCity` ASC) VISIBLE,
  CONSTRAINT `fk_Addresses_States1`
    FOREIGN KEY (`States_idState`)
    REFERENCES `projeto_ong`.`States` (`idState`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Addresses_Cities1`
    FOREIGN KEY (`Cities_idCity`)
    REFERENCES `projeto_ong`.`Cities` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Employees` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `nameEmployee` VARCHAR(50) NULL,
  `email` VARCHAR(100) NULL,
  `cellPhoneNumber` CHAR(11) NULL,
  `passwordHash` VARCHAR(255) NULL,
  `validationToken` VARCHAR(255) NULL,
  `verificationCode` VARCHAR(255) NULL,
  `position` VARCHAR(50) NULL,
  `Addresses_idAddress` INT NULL,
  PRIMARY KEY (`idEmployee`),
  INDEX `fk_Employees_Addresses1_idx` (`Addresses_idAddress` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Addresses1`
    FOREIGN KEY (`Addresses_idAddress`)
    REFERENCES `projeto_ong`.`Addresses` (`idAddress`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nameUser` VARCHAR(50) NULL,
  `cellPhoneNumber` CHAR(11) NULL,
  `email` VARCHAR(100) NULL,
  `Addresses_idAddress` INT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_Users_Addresses1_idx` (`Addresses_idAddress` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Addresses1`
    FOREIGN KEY (`Addresses_idAddress`)
    REFERENCES `projeto_ong`.`Addresses` (`idAddress`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`DonationCategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`DonationCategories` (
  `idDonationCategory` INT NOT NULL AUTO_INCREMENT,
  `nameDonationCategory` VARCHAR(50) NULL,
  PRIMARY KEY (`idDonationCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`SupplementCategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`SupplementCategories` (
  `idSupplementCategory` INT NOT NULL AUTO_INCREMENT,
  `nameSupplementCategory` VARCHAR(50) NULL,
  PRIMARY KEY (`idSupplementCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Supplements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Supplements` (
  `idSupplement` INT NOT NULL AUTO_INCREMENT,
  `nameSupplement` VARCHAR(50) NULL,
  `stock` FLOAT(10,2) NULL,
  `typeMensure` CHAR(2) NULL,
  `SupplementCategories_idSupplementCategory` INT NOT NULL,
  PRIMARY KEY (`idSupplement`),
  INDEX `fk_Supplements_SupplementCategories1_idx` (`SupplementCategories_idSupplementCategory` ASC) VISIBLE,
  CONSTRAINT `fk_Supplements_SupplementCategories1`
    FOREIGN KEY (`SupplementCategories_idSupplementCategory`)
    REFERENCES `projeto_ong`.`SupplementCategories` (`idSupplementCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`SupplementInputs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`SupplementInputs` (
  `idSupplementInput` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(100) NULL,
  `amount` FLOAT(10,2) NULL,
  `inputDate` DATETIME NULL,
  `Supplements_idSupplement` INT NOT NULL,
  PRIMARY KEY (`idSupplementInput`),
  INDEX `fk_InuputSupplement_Supplements1_idx` (`Supplements_idSupplement` ASC) VISIBLE,
  CONSTRAINT `fk_InuputSupplement_Supplements1`
    FOREIGN KEY (`Supplements_idSupplement`)
    REFERENCES `projeto_ong`.`Supplements` (`idSupplement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Donations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Donations` (
  `idDonation` INT NOT NULL AUTO_INCREMENT,
  `valueDonation` FLOAT(10,2) NULL,
  `description` VARCHAR(100) NULL,
  `donationDate` DATETIME NULL,
  `Users_idUser` INT NULL,
  `DonationCategories_idDonationCategory` INT NOT NULL,
  `SupplementInputs_idSupplementInput` INT NULL,
  PRIMARY KEY (`idDonation`),
  INDEX `fk_Donations_Users1_idx` (`Users_idUser` ASC) VISIBLE,
  INDEX `fk_Donations_DonationCategories1_idx` (`DonationCategories_idDonationCategory` ASC) VISIBLE,
  INDEX `fk_Donations_SupplementInputs1_idx` (`SupplementInputs_idSupplementInput` ASC) VISIBLE,
  CONSTRAINT `fk_Donations_Users1`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `projeto_ong`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Donations_DonationCategories1`
    FOREIGN KEY (`DonationCategories_idDonationCategory`)
    REFERENCES `projeto_ong`.`DonationCategories` (`idDonationCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Donations_SupplementInputs1`
    FOREIGN KEY (`SupplementInputs_idSupplementInput`)
    REFERENCES `projeto_ong`.`SupplementInputs` (`idSupplementInput`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Species` (
  `idSpecies` INT NOT NULL AUTO_INCREMENT,
  `nameSpecies` VARCHAR(50) NULL,
  PRIMARY KEY (`idSpecies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Races`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Races` (
  `idRace` INT NOT NULL AUTO_INCREMENT,
  `nameRace` VARCHAR(50) NULL,
  PRIMARY KEY (`idRace`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Animals` (
  `idAnimal` INT NOT NULL AUTO_INCREMENT,
  `nameAnimal` VARCHAR(50) NULL,
  `size` VARCHAR(50) NULL,
  `status` VARCHAR(50) NULL,
  `description` VARCHAR(255) NULL,
  `Species_idSpecies` INT NOT NULL,
  `Races_idRace` INT NOT NULL,
  PRIMARY KEY (`idAnimal`),
  INDEX `fk_Animals_Species1_idx` (`Species_idSpecies` ASC) VISIBLE,
  INDEX `fk_Animals_Races1_idx` (`Races_idRace` ASC) VISIBLE,
  CONSTRAINT `fk_Animals_Species1`
    FOREIGN KEY (`Species_idSpecies`)
    REFERENCES `projeto_ong`.`Species` (`idSpecies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animals_Races1`
    FOREIGN KEY (`Races_idRace`)
    REFERENCES `projeto_ong`.`Races` (`idRace`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Adoptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Adoptions` (
  `idAdoption` INT NOT NULL AUTO_INCREMENT,
  `dateAdoption` DATE NULL,
  `statusAdoption` VARCHAR(50) NULL,
  `Animals_idAnimal` INT NOT NULL,
  `Users_idUser` INT NOT NULL,
  PRIMARY KEY (`idAdoption`),
  INDEX `fk_Adoptions_Animals1_idx` (`Animals_idAnimal` ASC) VISIBLE,
  INDEX `fk_Adoptions_Users1_idx` (`Users_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Adoptions_Animals1`
    FOREIGN KEY (`Animals_idAnimal`)
    REFERENCES `projeto_ong`.`Animals` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Adoptions_Users1`
    FOREIGN KEY (`Users_idUser`)
    REFERENCES `projeto_ong`.`Users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`ClinicalReports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`ClinicalReports` (
  `idClinicalReport` INT NOT NULL AUTO_INCREMENT,
  `registrationDate` DATE NULL,
  `editionDate` DATE NULL,
  `clinicalReport` VARCHAR(255) NULL,
  `Animals_idAnimal` INT NOT NULL,
  `Employees_idEmployee` INT NOT NULL,
  PRIMARY KEY (`idClinicalReport`),
  INDEX `fk_ClinicalReports_Animals1_idx` (`Animals_idAnimal` ASC) VISIBLE,
  INDEX `fk_ClinicalReports_Employees1_idx` (`Employees_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_ClinicalReports_Animals1`
    FOREIGN KEY (`Animals_idAnimal`)
    REFERENCES `projeto_ong`.`Animals` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClinicalReports_Employees1`
    FOREIGN KEY (`Employees_idEmployee`)
    REFERENCES `projeto_ong`.`Employees` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`ExpenseCategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`ExpenseCategories` (
  `idExpenseCategory` INT NOT NULL AUTO_INCREMENT,
  `nameExpenseCategory` VARCHAR(50) NULL,
  PRIMARY KEY (`idExpenseCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`Expenses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`Expenses` (
  `idExpense` INT NOT NULL AUTO_INCREMENT,
  `valueExpense` FLOAT(10,2) NULL,
  `description` VARCHAR(100) NULL,
  `registrationDate` DATE NULL,
  `paymentDate` DATE NULL,
  `dueDate` DATE NULL,
  `ExpenseCategories_idExpenseCategory` INT NOT NULL,
  PRIMARY KEY (`idExpense`),
  INDEX `fk_Expeses_ExpeseCategories1_idx` (`ExpenseCategories_idExpenseCategory` ASC) VISIBLE,
  CONSTRAINT `fk_Expeses_ExpeseCategories1`
    FOREIGN KEY (`ExpenseCategories_idExpenseCategory`)
    REFERENCES `projeto_ong`.`ExpenseCategories` (`idExpenseCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`MedicalPrescriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`MedicalPrescriptions` (
  `idMedicalPrescription` INT NOT NULL,
  `registrationDate` DATETIME NULL,
  `editionDate` DATETIME NULL,
  `description` VARCHAR(100) NULL,
  `Animals_idAnimal` INT NOT NULL,
  `Employees_idEmployee` INT NOT NULL,
  PRIMARY KEY (`idMedicalPrescription`),
  INDEX `fk_MedicalPrescription_Animals1_idx` (`Animals_idAnimal` ASC) VISIBLE,
  INDEX `fk_MedicalPrescription_Employees1_idx` (`Employees_idEmployee` ASC) VISIBLE,
  CONSTRAINT `fk_MedicalPrescription_Animals1`
    FOREIGN KEY (`Animals_idAnimal`)
    REFERENCES `projeto_ong`.`Animals` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MedicalPrescription_Employees1`
    FOREIGN KEY (`Employees_idEmployee`)
    REFERENCES `projeto_ong`.`Employees` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`MedicationDosages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`MedicationDosages` (
  `idMedicationDosages` INT NOT NULL AUTO_INCREMENT,
  `dosage` FLOAT(10,2) NULL,
  `time` CHAR(5) NULL,
  `observations` VARCHAR(100) NULL,
  `MedicalPrescriptions_idMedicalPrescription` INT NOT NULL,
  `Supplements_idSupplement` INT NOT NULL,
  INDEX `fk_MedicationDosages_MedicalPrescriptions1_idx` (`MedicalPrescriptions_idMedicalPrescription` ASC) VISIBLE,
  INDEX `fk_MedicationDosages_Supplements1_idx` (`Supplements_idSupplement` ASC) VISIBLE,
  PRIMARY KEY (`idMedicationDosages`),
  CONSTRAINT `fk_MedicationDosages_MedicalPrescriptions1`
    FOREIGN KEY (`MedicalPrescriptions_idMedicalPrescription`)
    REFERENCES `projeto_ong`.`MedicalPrescriptions` (`idMedicalPrescription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MedicationDosages_Supplements1`
    FOREIGN KEY (`Supplements_idSupplement`)
    REFERENCES `projeto_ong`.`Supplements` (`idSupplement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ong`.`SupplementOutputs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ong`.`SupplementOutputs` (
  `idSupplementOutput` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(100) NULL,
  `amount` FLOAT(10,2) NULL,
  `outputDate` DATETIME NULL,
  `Supplements_idSupplement` INT NOT NULL,
  PRIMARY KEY (`idSupplementOutput`),
  INDEX `fk_OutputSupplements_Supplements1_idx` (`Supplements_idSupplement` ASC) VISIBLE,
  CONSTRAINT `fk_OutputSupplements_Supplements1`
    FOREIGN KEY (`Supplements_idSupplement`)
    REFERENCES `projeto_ong`.`Supplements` (`idSupplement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
