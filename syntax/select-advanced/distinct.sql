SELECT author_lname FROM books;

-- 값의 유니크한 값만 가져온다.
SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname, author_lname) AS 'unique full name' FROM books;