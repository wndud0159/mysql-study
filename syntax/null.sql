CREATE DATABASE cat_app;

USE cat_app;

SELECT DATABASE();

CREATE TABLE cats(
  name VARCHAR(100) NOT NULL,
  age int NOT NULL
);

INSERT INTO cats(age) VALUES(3);

SHOW WARNINGS;

DROP TABLE cats;
DROP DATABASE cat_app;