USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `add_todo_for_user`//
CREATE PROCEDURE `add_todo_for_user` (IN local_username VARCHAR(64), IN new_todo_id INT, IN data_in VARCHAR(100), IN completed TINYINT)
BEGIN
	
	IF EXISTS(SELECT todo_id FROM db_todo.tbl_todo WHERE username = local_username AND todo_id = new_todo_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'duplicate todo ID';
	ELSE
		INSERT INTO db_todo.tbl_todo 
			(todo_id, data, completed, username)
		VALUES (new_todo_id, data_in, completed, local_username);
	END IF;
END//
delimiter ;
