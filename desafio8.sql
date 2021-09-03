DELIMITER $$

CREATE TRIGGER trigger_usuario_delete
  AFTER DELETE ON SpotifyClone.usuario
  FOR EACH ROW
BEGIN
  DELETE FROM SpotifyClone.usuario_seguindo_artista
    WHERE
      usuario_id = OLD.usuario_id;
  DELETE FROM SpotifyClone.usuario_historico_reproducoes
    WHERE
      usuario_id = OLD.usuario_id;
END $$

DELIMITER ;
