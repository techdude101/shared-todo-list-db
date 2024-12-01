USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `add_todo_for_user`//
CREATE PROCEDURE `add_todo_for_user_id` (IN user_id INT, IN new_todo_id INT, IN data VARCHAR(100), IN completed TINYINT)
BEGIN
	DECLARE local_user_id INT;
	SELECT id INTO local_user_id from db_todo.tbl_user WHERE id = user_id;
	
	IF EXISTS(SELECT todo_id FROM db_todo.tbl_todo WHERE tbl_user_id = local_user_id AND todo_id = new_todo_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'duplicate todo ID';
	ELSE
		INSERT INTO db_todo.tbl_todo 
			(todo_id, data, completed, tbl_user_id)
		VALUES (new_todo_id, data, completed, local_user_id);
	END IF;
END//
delimiter ;
