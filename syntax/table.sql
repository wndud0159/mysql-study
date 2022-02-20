CREATE DATABASE cat_app;

USE cat_app;

SELECT DATABASE();

CREATE TABLE cats(
  name VARCHAR(100),
  age int
);

SHOW TABLES;

SHOW COLUMNS FROM cats;
-- or
DESC cats;

DROP TABLE cats;

DROP DATABASE cat_app