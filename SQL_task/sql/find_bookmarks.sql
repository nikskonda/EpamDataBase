USE library;

SET @lang = 'ru';
SET @id = 3;

SELECT books.book_id,
	   coalesce(tbooks.name, books.def_name) AS `name`
	FROM books
		LEFT JOIN tbooks ON (books.book_id = tbooks.book_id AND tbooks.lang = @lang)
WHERE books.book_id IN 
	(
     SELECT bookmarks.book_id 
		FROM bookmarks
     WHERE bookmarks.user_id = @id
	);