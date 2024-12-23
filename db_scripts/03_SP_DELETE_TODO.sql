USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `delete_todo_for_user`//
CREATE PROCEDURE `delete_todo_for_user` (IN local_username VARCHAR(64), IN todo_id_to_delete INT)
BEGIN

  IF EXISTS(SELECT todo_id FROM db_todo.tbl_todo WHERE username = local_username AND todo_id = todo_id_to_delete) THEN
  DELETE FROM db_todo.tbl_todo WHERE username = local_username AND todo_id = todo_id_to_delete LIMIT 1;
  ELSE
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid user ID or todo ID';
  END IF;
END//
delimiter ;
