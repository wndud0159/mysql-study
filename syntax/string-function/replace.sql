SELECT REPLACE('Hello World', 'Hello', '!#!@#');

SELECT REPLACE('Hello,Wrold', ',', '-');

SELECT REPLACE(title, 'e', '3') FROM books;

SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string' FROM books;