USE library;

SET @book_id = 20;

SELECT *
	FROM books
WHERE books.book_id = @book_id;