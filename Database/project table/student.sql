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

