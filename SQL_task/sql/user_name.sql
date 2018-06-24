USE library;

SET @role_name = 'Moderator';

SELECT CONCAT(users.first_name, ' ', users.last_name) AS `Name`
	FROM users
WHERE users.role_id = 
		(SELECT roles.role_id
			FROM roles
		WHERE roles.role_name = @role_name);