SELECT Min(released_year) FROM books;

SELECT Max(pages) FROM books;


SELECT * FROM books WHERE pages=(SELECT Min(pages) FROM books);

SELECT * FROM books ORDER BY pages ASC LIMIT 1;