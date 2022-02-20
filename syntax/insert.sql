CREATE DATABASE cat_app;

USE cat_app;

CREATE TABLE cats (
  name VARCHAR(100),
  age int
);

INSERT INTO cats(name, age) VALUES('Blue', 1);
INSERT INTO cats(age, name) VALUES(3, 'Draco');

SELECT * FROM cats;

-- Multiple insert
INSERT INTO cats(name, age) VALUES
('Peanut', 3),
("But\'cat\'ter", 2);

-- 삽입된 값에 따옴표를 사용하는 방법 백슬래쉬를 사용한다 "\"cats"\"

DROP TABLE cats;
DROP DATABASE cat_app;