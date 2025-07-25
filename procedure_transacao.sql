DELIMITER $$

CREATE PROCEDURE transacao_exemplo(
    IN p_account_id INT,
    IN p_valor DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro detectado, transação revertida.' AS mensagem;
    END;

    START TRANSACTION;

    -- Define ponto de salvamento
    SAVEPOINT before_update;

    -- Atualiza saldo
    UPDATE account SET balance = balance - p_valor WHERE account_id = p_account_id;

    -- Suponha que aqui ocorre alguma validação, se falhar volta ao savepoint
    IF (p_valor > 1000) THEN
        ROLLBACK TO SAVEPOINT before_update;
        SELECT 'Valor acima do limite, operação revertida parcialmente.' AS mensagem;
    ELSE
        COMMIT;
        SELECT 'Transação concluída com sucesso.' AS mensagem;
    END IF;

END$$

DELIMITER ;
