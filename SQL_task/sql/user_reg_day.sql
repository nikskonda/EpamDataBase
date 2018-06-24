USE library;

SET @user_id = 1;

SELECT DATE_FORMAT(users.registration_date, '%e-%M-%y %k:%i') AS `Registration Day`
	FROM users
WHERE users.user_id = @user_id;