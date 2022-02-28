SELECT REVERSE('Hello World');

SELECT CONCAT('woof', REVERSE('woof'));

SELECT CONCAT(author_fname, '-reverce-', REVERSE(author_fname)) FROM books;