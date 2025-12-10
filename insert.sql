INSERT INTO usuario (id_usuario, nome, login, senha)
VALUES (1, 'Luis', 'LG12', 'LG24'),
	   (2, 'PY', 'PY1', 'PY2'),
       (3, 'PV', 'PV1', 'PV2');

INSERT INTO tecnico(id_usuario, registro_profissional)
VALUES (1, 'CFT');

INSERT INTO gerente (id_usuario, nivel_gerencia)
VALUES (1, 'Operacional'),
	   (2, 'Estrátegico'),
       (3, 'Tático');

INSERT INTO coordenador (id_usuario, area_responsavel)
VALUES (1, 'Maquinário');

INSERT INTO equipamento(id_equipamento, codigo, nome, fabricante, setor, data_aquisicao)
VALUES (1, '123456', 'Maquita', 'Proton', 'industrial', '2020-12-21'); 

INSERT INTO ordem_servico(id_os, tipo_os, prioridade, status_atual, descricao, data_abertura, data_encerramento, id_equipamento, id_tecnico_responsavel, id_tecnico_solucionador)
VALUES (1, 'Preventiva', 'prioridade: 1', 'Status: Em andamento', 'Manutencao de Computador', '2023-07-13 17:35:00', '2023-08-15 15:45:55', 1, 1, 1);

INSERT INTO registro_historico(id_registro, data_evento, tipo_acao, detalhes, id_os, id_usuario)
VALUES (1, '2023-07-13 17:36:20', 'Preventiva', 'Executada', 1, 1);

INSERT INTO relatorio_desempenho(id_relatorio, periodo_referencia, dados_resumo, versao, id_gerente)
VALUES(1, 'Matutino', 'Realizado com sucesso', 1, 1),
	  (4, 'Vespertino', 'Manutenção em andamento', 2, 2),
      (5,'Noturno', 'Manutenção sendo Iniciada', 3, 3);
