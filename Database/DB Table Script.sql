-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema course
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema course
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `course` DEFAULT CHARACTER SET utf8mb3 ;
USE `course` ;

-- -----------------------------------------------------
-- Table `course`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`department` (
  `dept_no` BIGINT NOT NULL AUTO_INCREMENT,
  `dept_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`dept_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`question` (
  `q_no` BIGINT NOT NULL AUTO_INCREMENT,
  `q_text` VARCHAR(200) NULL DEFAULT NULL,
  `q_answer` INT NULL DEFAULT NULL,
  `q_score` INT NULL DEFAULT NULL,
  `first` VARCHAR(50) NULL DEFAULT NULL,
  `second` VARCHAR(50) NULL DEFAULT NULL,
  `third` VARCHAR(50) NULL DEFAULT NULL,
  `forth` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`q_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`professor` (
  `prof_no` BIGINT NOT NULL AUTO_INCREMENT,
  `dept_no` BIGINT NULL DEFAULT NULL,
  `prof_name` VARCHAR(30) NULL DEFAULT NULL,
  `prof_email` VARCHAR(50) NULL DEFAULT NULL,
  `prof_id` VARCHAR(30) NULL DEFAULT NULL,
  `prof_pw` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`prof_no`),
  INDEX `professor_fk` (`dept_no` ASC) VISIBLE,
  CONSTRAINT `professor_fk`
    FOREIGN KEY (`dept_no`)
    REFERENCES `course`.`department` (`dept_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`subject` (
  `sub_no` BIGINT NOT NULL AUTO_INCREMENT,
  `sub_name` VARCHAR(50) NULL DEFAULT NULL,
  `sub_time` DATE NULL DEFAULT NULL,
  `sub_info` VARCHAR(100) NULL DEFAULT NULL,
  `prof_no` BIGINT NULL DEFAULT NULL,
  `dept_no` BIGINT NULL DEFAULT NULL,
  `sub_cnt` INT NULL DEFAULT NULL,
  PRIMARY KEY (`sub_no`),
  INDEX `subject_fk1` (`prof_no` ASC) VISIBLE,
  INDEX `subject_fk2` (`dept_no` ASC) VISIBLE,
  CONSTRAINT `subject_fk1`
    FOREIGN KEY (`prof_no`)
    REFERENCES `course`.`professor` (`prof_no`),
  CONSTRAINT `subject_fk2`
    FOREIGN KEY (`dept_no`)
    REFERENCES `course`.`department` (`dept_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`exam_frame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`exam_frame` (
  `exf_no` BIGINT NOT NULL AUTO_INCREMENT,
  `exf_name` VARCHAR(50) NULL DEFAULT NULL,
  `prof_no` BIGINT NULL DEFAULT NULL,
  `sub_no` BIGINT NULL DEFAULT NULL,
  `score` INT NULL DEFAULT NULL,
  `del_yn` TINYINT NOT NULL,
  PRIMARY KEY (`exf_no`),
  INDEX `exf_fk1` (`prof_no` ASC) VISIBLE,
  INDEX `exf_fk2` (`sub_no` ASC) VISIBLE,
  CONSTRAINT `exf_fk1`
    FOREIGN KEY (`prof_no`)
    REFERENCES `course`.`professor` (`prof_no`),
  CONSTRAINT `exf_fk2`
    FOREIGN KEY (`sub_no`)
    REFERENCES `course`.`subject` (`sub_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`exam` (
  `ex_no` BIGINT NOT NULL AUTO_INCREMENT,
  `q_no` BIGINT NULL DEFAULT NULL,
  `exf_no` BIGINT NULL DEFAULT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL,
  `del_yn` TINYINT NOT NULL,
  PRIMARY KEY (`ex_no`),
  INDEX `exam_fk1` (`q_no` ASC) VISIBLE,
  INDEX `exam_fk2` (`exf_no` ASC) VISIBLE,
  CONSTRAINT `exam_fk1`
    FOREIGN KEY (`q_no`)
    REFERENCES `course`.`question` (`q_no`),
  CONSTRAINT `exam_fk2`
    FOREIGN KEY (`exf_no`)
    REFERENCES `course`.`exam_frame` (`exf_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`root`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`root` (
  `root_no` BIGINT NOT NULL AUTO_INCREMENT,
  `root_id` VARCHAR(30) NULL DEFAULT NULL,
  `root_pw` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`root_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`student` (
  `stu_no` BIGINT NOT NULL AUTO_INCREMENT,
  `stu_id` VARCHAR(30) NULL DEFAULT NULL,
  `stu_pw` VARCHAR(30) NULL DEFAULT NULL,
  `stu_name` VARCHAR(30) NULL DEFAULT NULL,
  `dept_no` BIGINT NULL DEFAULT NULL,
  `stu_phone` VARCHAR(30) NULL DEFAULT NULL,
  `stu_email` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`stu_no`),
  INDEX `student_fk` (`dept_no` ASC) VISIBLE,
  CONSTRAINT `student_fk`
    FOREIGN KEY (`dept_no`)
    REFERENCES `course`.`department` (`dept_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`stu_ans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`stu_ans` (
  `answer_id` BIGINT NOT NULL AUTO_INCREMENT,
  `ex_no` BIGINT NULL DEFAULT NULL,
  `q_no` BIGINT NULL DEFAULT NULL,
  `es_input` TINYINT NULL DEFAULT NULL,
  `es_correct` TINYINT NULL DEFAULT NULL,
  `stu_no` BIGINT NULL DEFAULT NULL,
  `exf_no` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  INDEX `stu_ans_fk1` (`ex_no` ASC) VISIBLE,
  INDEX `stu_ans_fk2` (`q_no` ASC) VISIBLE,
  INDEX `stu_ans_fk3` (`stu_no` ASC) VISIBLE,
  INDEX `stu_ans_fk4` (`exf_no` ASC) VISIBLE,
  CONSTRAINT `stu_ans_fk1`
    FOREIGN KEY (`ex_no`)
    REFERENCES `course`.`exam` (`ex_no`),
  CONSTRAINT `stu_ans_fk2`
    FOREIGN KEY (`q_no`)
    REFERENCES `course`.`question` (`q_no`),
  CONSTRAINT `stu_ans_fk3`
    FOREIGN KEY (`stu_no`)
    REFERENCES `course`.`student` (`stu_no`),
  CONSTRAINT `stu_ans_fk4`
    FOREIGN KEY (`exf_no`)
    REFERENCES `course`.`exam_frame` (`exf_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `course`.`stu_sub_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `course`.`stu_sub_info` (
  `stu_s_idx` BIGINT NOT NULL AUTO_INCREMENT,
  `stu_no` BIGINT NULL DEFAULT NULL,
  `sub_no` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`stu_s_idx`),
  INDEX `s_c_t_fk1` (`stu_no` ASC) VISIBLE,
  INDEX `s_c_t_fk2` (`sub_no` ASC) VISIBLE,
  CONSTRAINT `s_c_t_fk1`
    FOREIGN KEY (`stu_no`)
    REFERENCES `course`.`student` (`stu_no`),
  CONSTRAINT `s_c_t_fk2`
    FOREIGN KEY (`sub_no`)
    REFERENCES `course`.`subject` (`sub_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
