CREATE USER 'todo_user'@'%' IDENTIFIED BY '<changeme>';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `db_todo`.* TO 'todo_user';

use db_todo;
GRANT EXECUTE ON PROCEDURE db_todo.get_todos_for_user TO 'todo_user'@'%';
GRANT EXECUTE ON PROCEDURE db_todo.add_todo_for_user TO 'todo_user'@'%';
GRANT EXECUTE ON PROCEDURE db_todo.update_todo_for_user TO 'todo_user'@'%';
GRANT EXECUTE ON PROCEDURE db_todo.delete_todo_for_user TO 'todo_user'@'%';
