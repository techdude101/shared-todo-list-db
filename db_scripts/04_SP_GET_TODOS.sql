USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `get_todos_for_user`;
CREATE PROCEDURE `get_todos_for_user` (IN local_username VARCHAR(64))
BEGIN
	SELECT todo_id, data, completed, completed_timestamp FROM db_todo.tbl_todo WHERE username = local_username;
END//
delimiter ;
