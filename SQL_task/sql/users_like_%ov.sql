USE library;
SELECT users.login,
	   users.first_name, 
       users.last_name
	FROM users
WHERE users.last_name LIKE '%ov';

