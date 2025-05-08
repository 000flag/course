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


-------------- Data Insert --------------

-- -----------------------------------------------------
-- Data - department
-- -----------------------------------------------------
SELECT * FROM course.department;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE department;
SET FOREIGN_KEY_CHECKS = 1;
SELECT * FROM course.department;
INSERT INTO department (dept_name)
VALUES
('컴퓨터공학과'),
('전자공학과'),
('기계공학과'),
('경영학과'),
('심리학과'),
('화학공학과');
SELECT * FROM course.department;

-- -----------------------------------------------------
-- Data - professor
-- -----------------------------------------------------
SELECT * FROM course.professor;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE professor;
SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO professor (prof_name, prof_email, prof_id, prof_pw, dept_no)
VALUES 
  -- 컴퓨터공학과

('최두훈', 'chlengns@naver.com', 'chlengns', '1234',1),
('박지민', 'parkjm@school.com', 'prof002', 'password456', 1),
('이상현', 'lee.sh@school.com', 'prof003', 'password789', 2),  -- 전자공학과
('최윤아', 'choiya@school.com', 'prof004', 'password321', 2),
('홍길동', 'honggd@school.com', 'prof005', 'password654', 3),  -- 기계공학과
('김유진', 'kimyj@school.com', 'prof006', 'password987', 3),
('정수영', 'jeongsy@school.com', 'prof007', 'password234', 4),  -- 경영학과
('한지수', 'hanjs@school.com', 'prof008', 'password876', 4),
('강미래', 'kangmr@school.com', 'prof009', 'password555', 5),  -- 심리학과
('오지현', 'ohjh@school.com', 'prof010', 'password444', 5),
('임태훈', 'imth@school.com', 'prof011', 'password666', 6),  -- 화학공학과
('배윤서', 'baeys@school.com', 'prof012', 'password777', 6);
SELECT * FROM course.professor;

-- -----------------------------------------------------
-- Data - subject
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE subject;
SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO subject (sub_name, sub_time, sub_info, sub_cnt, prof_no, dept_no)
VALUES 
('알고리즘', '2024-03-01', '알고리즘 기초 및 응용', 30, 1, 1),  -- 교수번호 1번(김철수), 학과번호 1번(컴퓨터공학과)
('자료구조', '2024-04-01', '자료구조의 이해 및 활용', 30, 2, 1);  -- 교수번호 2번(박지민), 학과번호 1번(컴퓨터공학과)

-- 전자공학과 과목
INSERT INTO subject (sub_name, sub_time, sub_info, sub_cnt, prof_no, dept_no)
VALUES 
('회로이론', '2024-03-01', '전자회로의 이론적 이해', 25, 3, 2),  -- 교수번호 3번(이상현), 학과번호 2번(전자공학과)
('전자기학', '2024-04-01', '전자기학의 기초와 응용', 25, 4, 2);  -- 교수번호 4번(최윤아), 학과번호 2번(전자공학과)

-- 기계공학과 과목
INSERT INTO subject (sub_name, sub_time, sub_info, sub_cnt, prof_no, dept_no)
VALUES 
('역학', '2024-03-01', '기계 시스템의 기초 역학', 30, 5, 3),  -- 교수번호 5번(홍길동), 학과번호 3번(기계공학과)
('열역학', '2024-04-01', '열역학의 이론과 응용', 30, 6, 3);  -- 교수번호 6번(김유진), 학과번호 3번(기계공학과)

-- 경영학과 과목
INSERT INTO subject (sub_name, sub_time, sub_info, sub_cnt, prof_no, dept_no)
VALUES 
('경영학원론', '2024-03-01', '경영학의 기초 이론', 40, 7, 4),  -- 교수번호 7번(정수영), 학과번호 4번(경영학과)
('마케팅', '2024-04-01', '마케팅 이론과 전략', 40, 8, 4);  -- 교수번호 8번(한지수), 학과번호 4번(경영학과)

-- 심리학과 과목
INSERT INTO subject (sub_name, sub_time, sub_info, sub_cnt, prof_no, dept_no)
VALUES 
('심리학개론', '2024-03-01', '심리학의 기초 이론', 35, 9, 5),  -- 교수번호 9번(강미래), 학과번호 5번(심리학과)
('사회심리학', '2024-04-01', '사회심리학의 원리와 적용', 35, 10, 5);  -- 교수번호 10번(오지현), 학과번호 5번(심리학과)

-- 화학공학과 과목
INSERT INTO subject (sub_name, sub_time, sub_info, sub_cnt, prof_no, dept_no)
VALUES 
('화학공학개론', '2024-03-01', '화학공학의 기초 이론', 30, 11, 6),  -- 교수번호 11번(임태훈), 학과번호 6번(화학공학과)
('공정설계', '2024-04-01', '화학공정 설계와 최적화', 30, 12, 6);  -- 교수번호 12번(배윤서), 학과번호 6번(화학공학과)

SELECT * FROM course.subject;

-- -----------------------------------------------------
-- Data - student
-- -----------------------------------------------------
SELECT * FROM course.student;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE student;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM student;
INSERT INTO student (stu_id, stu_pw, stu_name, stu_phone, stu_email)
VALUES
('random1', 'abcd1234', '김철수', '010-1234-5678', 'random1@example.cdepartmentom'),
('userxy7', 'qwerty23', '이영희', '010-2345-6789', 'userxy7@example.com'),
('temp889', 'zxcvbn54', '박민준', '010-3456-7890', 'temp889@example.com'),
('hello42', 'az09wer3', '최민정', '010-4567-8901', 'hello42@example.com'),
('john77', '1234abcd', '윤아름', '010-5678-9012', 'john77@example.com'),
('skyline', 'xyz98765', '정지호', '010-6789-0123', 'skyline@example.com'),
('track55', 'passw123', '강서윤', '010-7890-1234', 'track55@example.com'),
('beagle23', 'qazwsx78', '문현우', '010-8901-2345', 'beagle23@example.com'),
('alpha99', '0987abcd', '오나경', '010-9012-3456', 'alpha99@example.com'),
('gamma66', 'poiuy098', '백하은', '010-1234-5678', 'gamma66@example.com'),
('hero123', 'mnvcxz45', '유승호', '010-2345-6789', 'hero123@example.com'),
('pixel56', 'lkjh0987', '안지민', '010-3456-7890', 'pixel56@example.com'),
('warp009', 'pass4455', '고민수', '010-4567-8901', 'warp009@example.com'),
('silverX', 'zxcv8888', '한나래', '010-5678-9012', 'silverX@example.com'),
('golden7', 'erty9090', '조승연', '010-6789-0123', 'golden7@example.com'),
('prime45', 'abcd9944', '강예진', '010-7890-1234', 'prime45@example.com'),
('orbit66', 'pass3344', '김도윤', '010-8901-2345', 'orbit66@example.com'),
('vector3', 'asdfgh12', '이지안', '010-9012-3456', 'vector3@example.com'),
('galaxy9', 'qwer88aa', '윤세빈', '010-1122-3344', 'galaxy9@example.com'),
('nova88', 'poiu77bb', '최유리', '010-2233-4455', 'nova88@example.com');

UPDATE student SET dept_no = 1 WHERE stu_no = 1;
UPDATE student SET dept_no = 3 WHERE stu_no = 2;
UPDATE student SET dept_no = 5 WHERE stu_no = 3;
UPDATE student SET dept_no = 2 WHERE stu_no = 4;
UPDATE student SET dept_no = 6 WHERE stu_no = 5;
UPDATE student SET dept_no = 4 WHERE stu_no = 6;
UPDATE student SET dept_no = 1 WHERE stu_no = 7;
UPDATE student SET dept_no = 3 WHERE stu_no = 8;
UPDATE student SET dept_no = 2 WHERE stu_no = 9;
UPDATE student SET dept_no = 5 WHERE stu_no = 10;
UPDATE student SET dept_no = 4 WHERE stu_no = 11;
UPDATE student SET dept_no = 6 WHERE stu_no = 12;
UPDATE student SET dept_no = 1 WHERE stu_no = 13;
UPDATE student SET dept_no = 2 WHERE stu_no = 14;
UPDATE student SET dept_no = 3 WHERE stu_no = 15;
UPDATE student SET dept_no = 5 WHERE stu_no = 16;
UPDATE student SET dept_no = 4 WHERE stu_no = 17;
UPDATE student SET dept_no = 6 WHERE stu_no = 18;
UPDATE student SET dept_no = 1 WHERE stu_no = 19;
UPDATE student SET dept_no = 2 WHERE stu_no = 20;

-- -----------------------------------------------------
-- Data - root
-- -----------------------------------------------------
SELECT * FROM course.root;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE root;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO root (root_id, root_pw)
VALUES ('admin', 'admin123');

-- -----------------------------------------------------
-- Data - stu_sub_info
-- -----------------------------------------------------
SELECT * FROM course.stu_sub_info;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE stu_sub_info;
SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (1, 1);  -- 알고리즘
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (1, 2);  -- 자료구조

-- 학생 2번 (이영희)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (2, 1);  -- 알고리즘
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (2, 2);  -- 자료구조

-- 전자공학과 (dept_no 2번) 학생들
-- 학생 3번 (박지민)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (3, 3);  -- 회로이론
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (3, 4);  -- 전자기학

-- 학생 4번 (최윤아)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (4, 3);  -- 회로이론
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (4, 4);  -- 전자기학

-- 기계공학과 (dept_no 3번) 학생들
-- 학생 5번 (홍길동)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (5, 5);  -- 역학
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (5, 6);  -- 열역학

-- 학생 6번 (김유진)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (6, 5);  -- 역학
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (6, 6);  -- 열역학

-- 경영학과 (dept_no 4번) 학생들
-- 학생 7번 (오지현)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (7, 7);  -- 경영학원론
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (7, 8);  -- 마케팅

-- 학생 8번 (정수영)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (8, 7);  -- 경영학원론
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (8, 8);  -- 마케팅

-- 심리학과 (dept_no 5번) 학생들
-- 학생 9번 (한지수)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (9, 9);  -- 사회심리학
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (9, 10);  -- 심리학개론

-- 학생 10번 (강미래)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (10, 9);  -- 사회심리학
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (10, 10);  -- 심리학개론

-- 화학공학과 (dept_no 6번) 학생들
-- 학생 11번 (오세훈)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (11, 11);  -- 화학공학개론
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (11, 6);   -- 열역학

-- 학생 12번 (이수연)
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (12, 11);  -- 화학공학개론
INSERT INTO stu_sub_info (stu_no, sub_no) VALUES (12, 6);   -- 열역학
SELECT * FROM course.stu_sub_info;

-- -----------------------------------------------------
-- Data - question
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE question;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM course.question;
INSERT INTO question (q_text, q_answer, q_score, first, second, third, forth) VALUES
-- Midterm - 알고리즘
('다음 중 정렬 알고리즘이 아닌 것은?', 2, 5, '퀵 정렬', '이진 탐색', '병합 정렬', '버블 정렬'),
( '다익스트라 알고리즘의 목적은?', 1, 5, '최단 경로 계산', '최소 신장 트리 구성', '최대 흐름 계산', '정렬 수행'),
('분할 정복 알고리즘의 핵심 개념은?', 3, 10, '반복적인 계산', '모든 경우의 수 탐색', '문제를 더 작은 문제로 분할', '재귀 사용 제한'),

-- Final - 알고리즘
('힙 정렬의 시간 복잡도는?', 1, 5, 'O(n log n)', 'O(n^2)', 'O(log n)', 'O(1)'),
('그래프 탐색에서 DFS는?', 4, 10, '큐 기반', 'BFS와 동일', '동적 프로그래밍 사용', '스택 기반'),
('이진 탐색의 전제 조건은?', 2, 5, '모든 데이터 정렬 무관', '데이터 정렬 필요', '데이터 개수 짝수', '키 값 필요'),

-- Midterm - 자료구조
('스택에서 사용하는 연산은?', 1, 5, 'PUSH와 POP', 'ENQUEUE와 DEQUEUE', '삽입과 삭제', '정렬과 검색'),
('다음 중 그래프의 탐색 알고리즘은?', 3, 5, '버블 정렬', '삽입 정렬', '너비 우선 탐색', '퀵 정렬'),
('큐(Queue)의 특징은?', 2, 10, 'LIFO', 'FIFO', '임의 접근 가능', '양방향 접근 가능'),

-- Final - 자료구조
( '이진 트리의 최대 높이는?', 1, 5, 'log2(n+1)', 'n-1', 'n+1', 'sqrt(n)'),
('다음 중 이진 트리가 아닌 구조는?', 2, 10, 'AVL 트리', 'DAG', '힙', 'BST'),
('해시 테이블의 주요 연산은?', 3, 5, '정렬', '순차 탐색', '충돌 처리', '그래프 구성'),

-- Midterm - 회로이론
('옴의 법칙은 무엇을 설명하는가?', 1, 10, '전압, 전류, 저항의 관계', '전기장의 세기', '자기장의 방향', '회로의 공진 주파수'),
('전압과 전류의 관계에서 전압은?', 2, 5, '전류와 반비례', '저항과 전류의 곱', '전류의 제곱', '저항의 역수'),
('직렬 회로의 특징은?', 4, 5, '전압 일정', '전류 분배', '전력 보존', '전류 일정'),

-- Final - 회로이론
('병렬 회로의 특징은?', 3, 5, '전류 일정', '전압 분배', '전압 일정', '임피던스 감소'),
('커패시터의 단위는?', 1, 5, '패럿(F)', '옴(Ω)', '헨리(H)', '와트(W)'),
('회로 해석법 중 키르히호프 법칙은?', 2, 10, '전압 변환', '전류 및 전압 법칙', '임피던스 계산', '저항 최소화'),

-- Midterm - 심리학개론
('심리학의 주요 연구 대상은?', 1, 5, '인간 행동과 정신 과정', '생물학적 시스템', '사회적 규범', '역사적 사건'),
('인지 심리학의 초점은?', 2, 10, '행동 관찰', '정보 처리 과정', '뇌 구조 분석', '사회적 맥락 분석'),
('프로이트의 이론에서 무의식이란?', 3, 5, '행동 패턴', '사고 체계', '의식 밖의 정신 활동', '사회적 학습'),

-- Final - 심리학개론
( '행동주의의 주요 개념은?', 1, 10, '자극과 반응의 관계', '무의식의 분석', '사회적 동기', '문화적 맥락'),
( '매슬로우의 욕구 계층에서 가장 높은 단계는?', 4, 5, '사회적 욕구', '안전 욕구', '존경 욕구', '자아실현 욕구'),
('조건화 이론의 창시자는?', 3, 5, '프로이트', '매슬로우', '파블로프', '로저스');

-- -----------------------------------------------------
-- Data - exam_frame
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE exam_frame;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO exam_frame (exf_name, prof_no, sub_no, score, del_yn) VALUES
-- 컴퓨터공학과
('Midterm - 알고리즘', 1, 1, 100, 0),
('Midterm - 자료구조', 2, 2, 50, 0),

-- 전자공학과
('Midterm - 회로이론', 3, 3, 20, 0),
('Midterm - 전자기학', 4, 4, 100, 0),

-- 기계공학과
('Midterm - 역학', 5, 5, 50, 0),
('Midterm - 열역학', 6, 6, 20, 0),

-- 경영학과
('Midterm - 경영학원론', 7, 7, 100, 0),
('Midterm - 마케팅', 8, 8, 50, 0),

-- 심리학과
('Midterm - 심리학개론', 9, 9, 20, 0),
('Midterm - 사회심리학', 10, 10, 100, 0),

-- 화학공학과
('Midterm - 화학공학개론', 11, 11, 50, 0),
('Midterm - 공정설계', 12, 12, 20, 0),

-- 추가 시험지
('Final - 알고리즘', 1, 1, 50, 0),
('Final - 자료구조', 2, 2, 20, 0),
('Final - 회로이론', 3, 3, 100, 0),
('Final - 전자기학', 4, 4, 50, 0),
('Final - 역학', 5, 5, 20, 0),
('Final - 열역학', 6, 6, 100, 0),
('Final - 경영학원론', 7, 7, 50, 0),
('Final - 마케팅', 8, 8, 20, 0),
('Final - 심리학개론', 9, 9, 100, 0),
('Final - 사회심리학', 10, 10, 50, 0),
('Final - 화학공학개론', 11, 11, 20, 0),
('Final - 공정설계', 12, 12, 100, 0);
INSERT INTO exam_frame (exf_name, prof_no, sub_no, score, del_yn) VALUES
-- 컴퓨터공학과
('Midterm - 알고리즘', 1, 1, 100, 0),
('Midterm - 자료구조', 2, 2, 50, 0),

-- 전자공학과
('Midterm - 회로이론', 3, 3, 20, 0),
('Midterm - 전자기학', 4, 4, 100, 0),

-- 기계공학과
('Midterm - 역학', 5, 5, 50, 0),
('Midterm - 열역학', 6, 6, 20, 0),

-- 경영학과
('Midterm - 경영학원론', 7, 7, 100, 0),
('Midterm - 마케팅', 8, 8, 50, 0),

-- 심리학과
('Midterm - 심리학개론', 9, 9, 20, 0),
('Midterm - 사회심리학', 10, 10, 100, 0),

-- 화학공학과
('Midterm - 화학공학개론', 11, 11, 50, 0),
('Midterm - 공정설계', 12, 12, 20, 0),

-- 추가 시험지
('Final - 알고리즘', 1, 1, 50, 0),
('Final - 자료구조', 2, 2, 20, 0),
('Final - 회로이론', 3, 3, 100, 0),
('Final - 전자기학', 4, 4, 50, 0),
('Final - 역학', 5, 5, 20, 0),
('Final - 열역학', 6, 6, 100, 0),
('Final - 경영학원론', 7, 7, 50, 0),
('Final - 마케팅', 8, 8, 20, 0),
('Final - 심리학개론', 9, 9, 100, 0),
('Final - 사회심리학', 10, 10, 50, 0),
('Final - 화학공학개론', 11, 11, 20, 0),
('Final - 공정설계', 12, 12, 100, 0);

-- -----------------------------------------------------
-- Data - exam
-- -----------------------------------------------------
SELECT * FROM course.exam;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE exam;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO exam (q_no, exf_no, status, del_yn) VALUES
-- Midterm - 알고리즘
(1, 1, '응시', 0),
(2, 1, '미응시', 0),
(3, 1, '응시', 0),
(4, 1, '미응시', 0),
(5, 1, '응시', 0),
(6, 1, '응시', 0),

-- Final - 알고리즘
(7, 12, '미응시', 0),
(8, 12, '응시', 0),
(9, 12, '응시', 0),
(10, 12, '응시', 0),

-- Midterm - 자료구조
(11, 2, '응시', 0),
(12, 2, '미응시', 0),
(13, 2, '응시', 0),
(14, 2, '응시', 0),
(15, 2, '응시', 0),
(16, 2, '미응시', 0),

-- Final - 자료구조
(17, 13, '응시', 0),
(18, 13, '응시', 0),
(19, 13, '미응시', 0),
(20, 13, '응시', 0),

-- Midterm - 회로이론
(21, 3, '응시', 0),
(22, 3, '미응시', 0),
(23, 3, '응시', 0),
(24, 3, '미응시', 0);

-- -----------------------------------------------------
-- Data - stu_ans
-- -----------------------------------------------------
SELECT * FROM course.stu_ans;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE stu_ans;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO stu_ans (ex_no, q_no, es_input, es_correct) VALUES
-- Midterm - 알고리즘
(1, 1, 2, 0),  -- 틀림 (2번 선택지: 이진 탐색)
(1, 2, 1, 1),  -- 맞음 (1번 선택지: 최단 경로 계산)
(1, 3, 3, 1),  -- 맞음 (3번 선택지: 문제를 더 작은 문제로 분할)

-- Final - 알고리즘
(12, 4, 1, 1),  -- 맞음 (1번 선택지: O(n log n))
(12, 5, 4, 0),  -- 틀림 (4번 선택지: 스택 기반)
(12, 6, 2, 0),  -- 틀림 (2번 선택지: 데이터 정렬 필요)

-- Midterm - 자료구조
(2, 7, 1, 1),  -- 맞음 (1번 선택지: PUSH와 POP)
(2, 8, 3, 1),  -- 맞음 (3번 선택지: 너비 우선 탐색)
(2, 9, 2, 0),  -- 틀림 (2번 선택지: FIFO)

-- Final - 자료구조
(13, 10, 1, 1),  -- 맞음 (1번 선택지: log2(n+1))
(13, 11, 3, 1),  -- 맞음 (3번 선택지: 충돌 처리)
(13, 12, 2, 0),  -- 틀림 (2번 선택지: DAG)

-- Midterm - 회로이론
(3, 13, 1, 1),  -- 맞음 (1번 선택지: 전압, 전류, 저항의 관계)
(3, 14, 2, 0),  -- 틀림 (2번 선택지: 전류와 반비례)
(3, 15, 4, 0),  -- 틀림 (4번 선택지: 전류 일정)

-- Final - 회로이론
(16, 16, 3, 1),  -- 맞음 (3번 선택지: 전류 일정)
(16, 17, 1, 1),  -- 맞음 (1번 선택지: 패럿(F))
(16, 18, 2, 10),  -- 맞음 (2번 선택지: 전류 및 전압 법칙)

-- Midterm - 심리학개론
(5, 19, 1, 1),  -- 맞음 (1번 선택지: 인간 행동과 정신 과정)
(5, 20, 2, 1),  -- 맞음 (2번 선택지: 정보 처리 과정)
(5, 21, 3, 1),  -- 맞음 (3번 선택지: 의식 밖의 정신 활동)

-- Final - 심리학개론
(15, 22, 1, 10),  -- 맞음 (1번 선택지: 자극과 반응의 관계)
(15, 23, 4, 0),  -- 틀림 (4번 선택지: 자아실현 욕구)
(15, 24, 3, 5);  -- 맞음 (3번 선택지: 파블로프)


-- 학생 더미 데이터 --
INSERT INTO student
(
	stu_id,
    stu_pw,
    stu_name,
    dept_no,
    stu_phone,
    stu_email
) values (
	'dkwkwlgus7','0116','유지현',1,'010-4175-6762','dkwkwlgus7@naver.com'
);