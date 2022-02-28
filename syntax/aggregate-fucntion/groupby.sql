
SELECT * FROM books;

SELECT DATABASE();
SELECT COUNT(*) AS 'count', author_fname, author_lname FROM books GROUP BY author_fname, author_lname;

SELECT  CONCAT('in ', released_year, ' ', COUNT(*), ' book(s) released') FROM books GROUP BY released_year;

SELECT author_fname, author_lname, Min(released_year) FROM books GROUP BY author_fname, author_lname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, Max(pages) FROM books GROUP BY author_fname, author_lname;

