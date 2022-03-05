- string type
CHAR - 길이 고정 길이보다 적으면 공백이 추가됨
VARCHAR - 변할 수 있는 길이 들어가는 값에 따라 메모리 데이터가 달라질 수 있음

- number type
int - 정수
decimal(5, 2) - 실수(길이,소숫점길이 설정가능) ex 5자리 수 소숫점 2자리
float 4bytes ~7digits 적은 메모리 수 정확성 높음
double 8bytes ~15digits 많은 메모리와 수 정확성 낮음

- data type
date - 'YYYY-MM-DD'
time - 'HH:MM:SS'
datetime - 'YYYY-MM-DD HH:MM:SS';

DROP TABLE people;
CREATE TABLE people (
  name VARCHAR(100),
  birthdate DATE,
  birthtime TIME,
  birthdt DATETIME default NOW() ON UPDATE NOW()
);

INSERT INTO people VALUES('padma', '1983-11-11', '10:07:35', NULL);
INSERT INTO people VALUES('padma', CURDATE(), CURTIME(), default);
SELECT * FROM people;

UPDATE people set name='juyoung'
WHERE people.name='padma';

-- 날짜 형식 바꾸기
SELECT  name, birthdate, DAY(birthdate) FROM people;
SELECT  name, birthdate, DAYNANE(birthdate) FROM people;
SELECT  name, birthdate, DAYOFWEEK(birthdate) FROM people;
SELECT  name, birthdate, DAYOFYEAR(birthdate) FROM people;

SELECT name, birthtime, HOUR(birthtime) FROM people;
SELECT name, birthtime, MINUTE(birthtime) FROM people;

SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
 
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;

SELECT DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT birthdt FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
 
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
 
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;



