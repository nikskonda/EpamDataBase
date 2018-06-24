USE library;

SET @news_id = 8;
SET @lang = 'ru';

SELECT news.def_title AS title,
	   news.def_text AS `text`
	FROM news
WHERE news.news_id = @news_id
    
UNION ALL

SELECT tnews.title,
	   tnews.text
	FROM tnews
WHERE tnews.news_id = @news_id AND tnews.lang = @lang;