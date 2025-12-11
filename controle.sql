USE TechMec;

-- Alteração na tabela ordem de serviço para por a coluna data_agendada
ALTER TABLE ordem_servico
MODIFY tipo_os VARCHAR(20) NOT NULL,
ADD COLUMN data_agendada DATE AFTER data_encerramento;

-- deletando a tabela manutencao_preventiva    
DROP TABLE manutencao_preventiva;

-- Subindo a informação correta para a coluna data na tabela equipamento
UPDATE equipamento
SET data_aquisicao = '2020-12-21'
WHERE codigo = '123456';

-- Subindo a informação correta para a coluna data_agendada na tabela ordem de serviço
UPDATE ordem_servico
SET data_agendada = '2022-12-22'
WHERE id_os = '1';

-- criando os usuários
CREATE USER 'Luis123'@'%' IDENTIFIED BY 'Guilherme123';
CREATE USER 'Luis456'@'%' IDENTIFIED BY 'Paulo456';
CREATE USER 'Jorge789'@'%' IDENTIFIED BY 'Farias789';

RENAME USER 'Luis123'@'%' TO 'Tecnico'@'%';
RENAME USER 'Luis456'@'%' TO 'Gerente'@'%';
RENAME USER 'Jorge789'@'%' TO 'Coordenador'@'%';

-- dando privilégios a eles
GRANT SELECT, INSERT ON TechMec.equipamento TO 'Luis123'@'%';
GRANT SELECT ON TechMec.relatorio_desempenho TO 'Luis456'@'%';
GRANT ALL PRIVILEGES ON TechMec TO 'Jorge789'@'%';

-- Revogando privilégio de 'Luis123'@'%'
REVOKE INSERT ON TechMec.equipamento FROM 'Luis123'@'%';

-- mostra os privilégios dos usuários
SHOW GRANTS FOR 'Jorge789'@'%';
SHOW GRANTS FOR 'Luis456'@'%';
SHOW GRANTS FOR 'Luis123'@'%';

-- inicia a transição 
START TRANSACTION;

INSERT INTO usuario (id_usuario, nome, login, senha)
VALUES(4, 'Luis Paulo', 'LP11', 'LP07'),
	  (5, 'Jorge', 'J10', 'J24');
      
COMMIT;      

START TRANSACTION;

INSERT INTO tecnico(id_usuario, registro_profissional)
VALUES (4, 'Aura');

-- Alteração feita dentro dessa transição iniciada é desfeita pelo Rollback
ROLLBACK;
