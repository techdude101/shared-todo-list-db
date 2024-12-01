USE db_todo;
delimiter //
CREATE PROCEDURE `get_todos_for_user` (IN user_id INT)
BEGIN
	SELECT todo_id, data, completed, completed_timestamp FROM db_todo.tbl_todo WHERE tbl_user_id = user_id;
END//

delimiter ;
