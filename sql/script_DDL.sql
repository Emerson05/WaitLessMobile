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
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `id_Endereco` INT NOT NULL AUTO_INCREMENT,
  `Cidade` VARCHAR(45) NOT NULL,
  `Cep` INT(8) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Logradouro` VARCHAR(45) NOT NULL,
  `Numero` INT NOT NULL,
  `Complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `Cpf` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Sobrenome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  `Endereco_id_Endereco` INT NOT NULL,
  PRIMARY KEY (`Cpf`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  INDEX `fk_Cliente_Endereco_idx` (`Endereco_id_Endereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco`
    FOREIGN KEY (`Endereco_id_Endereco`)
    REFERENCES `mydb`.`Endereco` (`id_Endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `Cnpj` VARCHAR(18) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(15) NOT NULL,
  `Telefone` VARCHAR(11) NOT NULL,
  `Hora_func` VARCHAR(25) NOT NULL,
  `Dia_func` VARCHAR(45) NOT NULL,
  `Endereco_id_Endereco` INT NOT NULL,
  PRIMARY KEY (`Cnpj`),
  INDEX `fk_Empresa_Endereco1_idx` (`Endereco_id_Endereco` ASC) VISIBLE,
  CONSTRAINT `fk_Empresa_Endereco1`
    FOREIGN KEY (`Endereco_id_Endereco`)
    REFERENCES `mydb`.`Endereco` (`id_Endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reserva` (
  `Empresa_Cnpj` VARCHAR(18) NULL,
  `Cliente_Cpf` VARCHAR(11) NULL,
  INDEX `fk_Empresa_has_Cliente_Cliente1_idx` (`Cliente_Cpf` ASC) VISIBLE,
  INDEX `fk_Empresa_has_Cliente_Empresa1_idx` (`Empresa_Cnpj` ASC) VISIBLE,
  UNIQUE INDEX `Empresa_Cnpj_UNIQUE` (`Empresa_Cnpj` ASC) VISIBLE,
  UNIQUE INDEX `Cliente_Cpf_UNIQUE` (`Cliente_Cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Empresa_has_Cliente_Empresa1`
    FOREIGN KEY (`Empresa_Cnpj`)
    REFERENCES `mydb`.`Empresa` (`Cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empresa_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_Cpf`)
    REFERENCES `mydb`.`Cliente` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lotacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lotacao` (
  `Empresa_Cnpj` VARCHAR(18) NOT NULL,
  `Capacidade_total` INT NOT NULL,
  `Qtd_lugares` INT NOT NULL,
  `Data` DATE NOT NULL,
  INDEX `fk_Lotacao_Empresa1_idx` (`Empresa_Cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Lotacao_Empresa1`
    FOREIGN KEY (`Empresa_Cnpj`)
    REFERENCES `mydb`.`Empresa` (`Cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cardapio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cardapio` (
  `Nome_produto` VARCHAR(30) NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Valor` DECIMAL(5,2) NOT NULL,
  `Empresa_Cnpj` VARCHAR(18) NOT NULL,
  INDEX `fk_Cardapio_Empresa1_idx` (`Empresa_Cnpj` ASC) VISIBLE,
  CONSTRAINT `fk_Cardapio_Empresa1`
    FOREIGN KEY (`Empresa_Cnpj`)
    REFERENCES `mydb`.`Empresa` (`Cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
