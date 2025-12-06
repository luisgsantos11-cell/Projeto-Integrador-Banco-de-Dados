USE TechMec;

-- Checando a tabela de usuário para saber como estão suas informações
SELECT*FROM usuario;

-- Checando a tabela do tecnico para ver o preenchimento de informações dela
SELECT*FROM tecnico;

SELECT*FROM coordenador;

-- Checando a tabela de equipamentos para ver o preenchimento de informações dela
SELECT*FROM relatorio_desempenho;

-- Checando a tabela de ordem serviço para ver o preenchimento de informações dela após o update
SELECT*FROM ordem_servico;

-- Consulta para checar os usuário de id maior que 1
SELECT*FROM usuario WHERE id_usuario > 1;

-- Listagem da tabela tecnico com dado de usuario e de tecnico
SELECT 
    u.id_usuario,
    u.nome,
    u.login,
    u.senha,
    t.registro_profissional
FROM usuario u
INNER JOIN tecnico t ON u.id_usuario = t.id_usuario;

-- Listagem da tabela gerente com dados de usuario e de gerente
SELECT
	u.id_usuario,
    u.nome,
    u.login,
    u.senha,
    g.nivel_gerencia
FROM usuario u
INNER JOIN gerente g ON u.id_usuario = g.id_usuario;

-- Listagem da Tabela Ordem de Serviço mostrando o tipo da ordem e a quantia executada.
SELECT 
    tipo_os,
    COUNT(*) AS total_os
FROM ordem_servico
GROUP BY tipo_os
ORDER BY total_os DESC;

-- Listagem da Tabela Ordem de Serviço mostrando o status da ordem e quantas ordens existem.
SELECT 
    status_atual,
    COUNT(*) AS total
FROM ordem_servico
GROUP BY status_atual
ORDER BY total DESC;

-- Listagem da tabela de relatorio desempenho para ver a média da versão do relatorio
SELECT AVG(versao) AS media_versoes
FROM relatorio_desempenho;

-- Listagem da tabela de relatorio desempenho para verificar a soma das versões
SELECT SUM(versao) AS soma_versoes
FROM relatorio_desempenho;