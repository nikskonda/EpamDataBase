USE library;

SET @lang = 'ru';

SELECT  news.news_id,
		COALESCE(tnews.title, news.def_title) AS title,
		news.publish_date, 
		news.photo_url,
        CONCAT(users.first_name, ' ', users.last_name) AS author
	FROM news
		LEFT JOIN tnews ON ((news.news_id = tnews.news_id) AND (tnews.lang=@lang))
        INNER JOIN users ON news.user_id = users.user_id
ORDER BY publish_date DESC;