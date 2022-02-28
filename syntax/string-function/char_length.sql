SELECT CHAR_LENGTH('Hello World');

SELECT CHAR_LENGTH(('안녕하세요'));


SELECT CONCAT(author_lname, 'is Length= ', CHAR_LENGTH(author_lname)) FROM books;