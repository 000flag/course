SELECT * FROM course.root;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE root;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO root (root_id, root_pw)
VALUES ('admin', 'admin123')