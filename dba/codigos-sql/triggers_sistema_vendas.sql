USE sistema_venda;

-- Exemplo de Triggers
DELIMITER //
CREATE TRIGGER historico_preco
AFTER UPDATE
ON produto FOR EACH ROW
BEGIN 
IF(OLD.preco <> NEW.preco) THEN
INSERT INTO alteracao_preco(preco_novo, preco_antigo, id_produto) VALUES
(NEW.preco, OLD.preco, NEW.id_produto);
END IF;
END //

DELIMITER //
CREATE TRIGGER set_preco
BEFORE INSERT
ON itens_venda FOR EACH ROW
SET New.preco = (SELECT preco FROM produto WHERE id_produto = NEW.id_produto);
END
//

-- fazer recalculo das vendas
DELIMITER //
CREATE TRIGGER update_itens_venda
BEFORE INSERT
ON itens_venda FOR EACH ROW
SET NEW.valor_bruto = (New.quantidade*New.preco),NEW.valor_total = (New.valor_bruto-
New.desconto+New.acrescimo);
END
//

DELIMITER //
CREATE TRIGGER recalculo_venda
BEFORE INSERT
ON itens_venda FOR EACH ROW
UPDATE venda SET valor_bruto = (SELECT SUM(valor_total) FROM itens_venda WHERE New.
id_venda = New.id_venda AND cancelado = 'N'), valor_total = (valor_bruto-desconto+
acrescimo) WHERE id_venda = NEW.id_venda;
END
//

-- Replicar o exemplo da Trigger
DELIMITER //
CREATE TRIGGER after_insert_itens_venda
AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN
    INSERT INTO alteracao_itens_venda (
        id_venda, id_produto, quantidade, preco, valor_bruto, valor_total, desconto, acrescimo, cancelado, tipo_operacao
    ) VALUES (
        NEW.id_venda, 
        NEW.id_produto, 
        NEW.quantidade, 
        NEW.preco, 
        NEW.valor_bruto, 
        NEW.valor_total, 
        NEW.desconto, 
        NEW.acrescimo, 
        NEW.cancelado, 
        'INSERCAO'
    );
END //

DELIMITER //
CREATE TRIGGER after_update_itens_venda
AFTER UPDATE ON itens_venda
FOR EACH ROW
BEGIN
    INSERT INTO alteracao_itens_venda (
        id_venda, id_produto, quantidade, preco, valor_bruto, valor_total, desconto, acrescimo, cancelado, tipo_operacao
    ) VALUES (
        NEW.id_venda, 
        NEW.id_produto, 
        NEW.quantidade, 
        NEW.preco, 
        NEW.valor_bruto, 
        NEW.valor_total, 
        NEW.desconto, 
        NEW.acrescimo, 
        NEW.cancelado, 
        'ATUALIZACAO'
    );
END //

-- Trigger para recalcular itens cancelados
SELECT * FROM venda;
SELECT * FROM itens_venda;

DELIMITER //
CREATE TRIGGER recalculo_estoque
AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN
    IF (NEW.cancelado = FALSE) THEN
        UPDATE produto 
        SET quantidade_estoque = quantidade_estoque - NEW.quantidade
        WHERE id_produto = NEW.id_produto;
    END IF;
END //

DELIMITER //
CREATE TRIGGER update_estoque_cancelamento
AFTER UPDATE ON itens_venda
FOR EACH ROW
BEGIN
    IF (NEW.cancelado = TRUE AND OLD.cancelado = FALSE) THEN
        UPDATE produto 
        SET quantidade_estoque = quantidade_estoque + OLD.quantidade
        WHERE id_produto = OLD.id_produto;
    END IF;
END //

ALTER TABLE itens_venda 
MODIFY COLUMN cancelado VARCHAR(1) DEFAULT 0;

-- Trigger para atualizar o estoque
DELIMITER //
CREATE TRIGGER recalculo_valor_venda
AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN
    UPDATE venda 
    SET valor_bruto = (SELECT SUM(valor_total) FROM itens_venda WHERE id_venda = NEW.id_venda AND cancelado = FALSE),
        valor_total = valor_bruto - desconto + acrescimo
    WHERE id_venda = NEW.id_venda;
END //

DELIMITER //
CREATE TRIGGER update_valor_venda_cancelamento
AFTER UPDATE ON itens_venda
FOR EACH ROW
BEGIN
    IF (NEW.cancelado = TRUE AND OLD.cancelado = FALSE) THEN
        UPDATE venda 
        SET valor_bruto = (
            SELECT IFNULL(SUM(valor_total), 0) 
            FROM itens_venda 
            WHERE id_venda = NEW.id_venda AND cancelado = FALSE
        ),
        valor_total = valor_bruto - desconto + acrescimo
        WHERE id_venda = NEW.id_venda;
    END IF;
END //