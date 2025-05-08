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
