DROP TABLE cats;
DROP DATABASE cat_app;
CREATE DATABASE cat_app;
USE cat_app;
SELECT DATABASE();

CREATE TABLE cats(
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  breed VARCHAR(100),
  age INT,
  PRIMARY KEY(id)
);

INSERT INTO cats(name, breed, age)
VALUES 
('Ringo', 'Tabby', 4),
('Cindy', 'Maine Coon', 10),
('Dumbledore', 'Maine Coon', 11),
('Egg', 'Persian', 4),
('Misty', 'Tabby', 13),
('George Michael', 'Ragdool', 9),
('Jackson', 'Sphynx', 7);