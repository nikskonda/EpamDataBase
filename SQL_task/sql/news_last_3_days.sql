USE library;
SELECT *
	FROM news
WHERE publish_date BETWEEN NOW() - INTERVAL 3 DAY AND NOW();
	