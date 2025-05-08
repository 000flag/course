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