CREATE DATABASE cat_app;

USE cat_app;

SELECT DATABASE();

CREATE TABLE cats(
  name VARCHAR(100) NOT NULL DEFAULT 'CatName',
  age int NOT NULL DEFAULT 0
);

DESC cats;

INSERT INTO cats(age, name) VALUES(default, default);
INSERT INTO cats() VALUES();

SELECT * FROM cats;

SHOW WARNINGS;

DROP TABLE cats;
DROP DATABASE cat_app;