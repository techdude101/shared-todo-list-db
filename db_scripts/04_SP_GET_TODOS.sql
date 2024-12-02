USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `get_todos_for_user_id`;
CREATE PROCEDURE `get_todos_for_user_id` (IN local_user_id INT)
BEGIN
	SELECT todo_id, data, completed, completed_timestamp FROM db_todo.tbl_todo WHERE user_id = local_user_id;
END//
delimiter ;
