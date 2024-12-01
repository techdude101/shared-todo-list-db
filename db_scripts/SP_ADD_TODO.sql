USE db_todo;
delimiter //
DROP PROCEDURE IF EXISTS `add_todo_for_user`//
CREATE PROCEDURE `add_todo_for_user` (IN usrname VARCHAR(16), IN todo_id INT, IN data VARCHAR(100), IN completed TINYINT)
BEGIN
	IF EXISTS (SELECT todo_id FROM db_todo.tbl_todo WHERE todo_id = todo_id AND tbl_user_id = (SELECT id from db_todo.tbl_user WHERE username = username)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'duplicate todo ID';
    ELSE
    		INSERT INTO db_todo.tbl_todo 
		(todo_id, data, completed, tbl_user_id)
		VALUES (todo_id, data, completed, (SELECT id from db_todo.tbl_user WHERE username = username));
    END IF;
END//
delimiter ;
