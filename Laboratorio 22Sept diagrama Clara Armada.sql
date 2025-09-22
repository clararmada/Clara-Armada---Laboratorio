-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tiktok
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tiktok
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tiktok` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tiktok` ;

-- -----------------------------------------------------
-- Table `tiktok`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiktok`.`usuario` (
  `id_Usuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Fecha_registro` DATE NOT NULL,
  `Pais_origen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tiktok`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiktok`.`videos` (
  `id_videos` INT NOT NULL AUTO_INCREMENT,
  `id_Usuario` INT NOT NULL,
  `titulo_video` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `fecha_publicacion` DATE NOT NULL,
  `duracion` TIME NOT NULL,
  PRIMARY KEY (`id_videos`),
  INDEX `usuario_idx` (`id_Usuario` ASC) VISIBLE,
  CONSTRAINT `usuario`
    FOREIGN KEY (`id_Usuario`)
    REFERENCES `tiktok`.`usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tiktok`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiktok`.`comentarios` (
  `id_Comentarios` INT NOT NULL AUTO_INCREMENT,
  `id_videos` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `texto_comentario` VARCHAR(500) NOT NULL,
  `fecha_comentario` DATE NOT NULL,
  PRIMARY KEY (`id_Comentarios`),
  INDEX `usuario_video_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `comentario_video_idx` (`id_videos` ASC) VISIBLE,
  CONSTRAINT `usuario_video`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `tiktok`.`usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comentario_video`
    FOREIGN KEY (`id_videos`)
    REFERENCES `tiktok`.`videos` (`id_videos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tiktok`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiktok`.`likes` (
  `id_likes` INT NOT NULL AUTO_INCREMENT,
  `id_videos` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `fecha_like` DATE NOT NULL,
  PRIMARY KEY (`id_likes`),
  INDEX `like_video_idx` (`id_videos` ASC) VISIBLE,
  INDEX `like_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `like_video`
    FOREIGN KEY (`id_videos`)
    REFERENCES `tiktok`.`videos` (`id_videos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `like_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `tiktok`.`usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 102
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tiktok`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tiktok`.`seguidores` (
  `id_seguidores` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_seguidor` INT NOT NULL,
  `id_usuario_seguido` INT NOT NULL,
  `fecha_seguimiento` DATE NOT NULL,
  `usuario_id_Usuario` INT NOT NULL,
  PRIMARY KEY (`id_seguidores`, `usuario_id_Usuario`),
  INDEX `fk_seguidores_usuario1_idx` (`usuario_id_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_seguidores_usuario1`
    FOREIGN KEY (`usuario_id_Usuario`)
    REFERENCES `tiktok`.`usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
