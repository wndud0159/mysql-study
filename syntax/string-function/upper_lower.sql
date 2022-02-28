SELECT UPPER('Hello World');

SELECT LOWER('Hello World');

SELECT UPPER(title) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

SELECT CONCAT(CONCAT(LOWER(LEFT(author_fname, 1)), SUBSTRING(author_fname, 2), ' ', CONCAT(LOWER(LEFT(author_lname, 1)), SUBSTRING(author_lname, 2)))AS 'full name' FROM books;