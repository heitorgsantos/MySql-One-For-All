DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
	BEFORE DELETE ON usuario
    FOR EACH ROW
BEGIN 
DELETE FROM seguindo WHERE id_user = old.id_user;
DELETE FROM historico 
WHERE
    id_user = old.id_user;
END $$

DELIMITER ;
