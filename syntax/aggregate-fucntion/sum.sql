SELECT Sum(pages) AS totalPages FROM books;

SELECT author_fname, author_lname, Sum(pages) FROM books GROUP BY author_fname, author_lname;

SELECT author_fname, author_lname, Sum(released_year) FROM books GROUP BY author_fname, author_lname;