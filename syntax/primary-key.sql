-- primary key, auto incremenet, unique
CREATE DATABASE cat_app;

USE cat_app;

SELECT DATABASE();

CREATE TABLE cats(
  id int NOT NULL AUTO_INCREMENT ,
  name VARCHAR(100) NOT NULL UNIQUE,
  age int NOT NULL DEFAULT 0 ,
  PRIMARY KEY (id)
);

DESC cats;

INSERT INTO cats(name, age) VALUES('giroto', default);
INSERT INTO cats() VALUES();

SELECT * FROM cats;

SHOW WARNINGS;

DROP TABLE cats;
DROP DATABASE cat_app;