USE library;
SELECT countries.country,
	   cities.city
	FROM countries
		INNER JOIN cities ON cities.country_id = countries.country_id;