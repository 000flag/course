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