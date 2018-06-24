USE library;

SELECT bookmarks.user_id,
	   bookmarks.book_id
	FROM bookmarks
WHERE bookmarks.book_id IN 
	(
     SELECT books.book_id 
		FROM books
	 WHERE ((bookmarks.page_number >= books.pages) OR (bookmarks.page_number <= 0))
     );