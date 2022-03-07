CREATE DATABASE trigger_demo;

USE trigger_demo;

CREATE TABLE users (
  username VARCHAR(100),
  age INT
);

INSERT INTO users VALUES('Juyoung', 19);

SELECT * FROM users;

DELIMITER $$

CREATE TRIGGER must_be_adult
  BEFORE INSERT
  ON users 
  FOR EACH ROW

  BEGIN
    IF NEW.age < 18
    THEN
      SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Must be an Adult!';
    END IF;
  END;

$$

DROP TRIGGER must_be_adult;

INSERT INTO users VALUES('Gyubi', 13);