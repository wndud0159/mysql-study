SELECT SUBSTRING('Hello World', 1, 5);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

SELECT CONCAT(SUBSTRING(title, 1, 10), '....') FROM books;