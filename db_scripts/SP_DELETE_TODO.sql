USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `delete_todo_for_user_id`//
CREATE PROCEDURE `delete_todo_for_user_id` (IN user_id INT, IN todo_id_to_delete INT)
BEGIN
	DECLARE local_user_id INT;
    SELECT id INTO local_user_id from db_todo.tbl_user WHERE id = user_id;
	
    IF EXISTS(SELECT todo_id FROM db_todo.tbl_todo WHERE tbl_user_id = local_user_id AND todo_id = todo_id_to_delete) THEN
		DELETE FROM db_todo.tbl_todo WHERE tbl_user_id = local_user_id AND todo_id = todo_id_to_delete LIMIT 1;
    ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid user ID or todo ID';
    END IF;
END//
delimiter ;
