USE library;

SELECT roles.role_name AS role,
	   COUNT(users.role_id) AS count
	FROM users
		LEFT JOIN roles USING(role_id)
GROUP BY users.role_id
	HAVING count > 0;