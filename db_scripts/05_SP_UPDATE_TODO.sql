USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `update_todo_for_user_id`//
CREATE PROCEDURE `update_todo_for_user_id` (IN local_user_id INT, IN todo_id_to_update INT, IN updated_data VARCHAR(100), IN completed_status TINYINT, IN updated_completed_timestamp INT UNSIGNED)
BEGIN
	
    IF EXISTS(SELECT todo_id FROM db_todo.tbl_todo WHERE user_id = local_user_id AND todo_id = todo_id_to_update) THEN
		UPDATE db_todo.tbl_todo SET data = updated_data, completed = completed_status, completed_timestamp = updated_completed_timestamp WHERE user_id = local_user_id AND todo_id = todo_id_to_update LIMIT 1;
    ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid user ID or todo ID';
    END IF;
END//
delimiter ;