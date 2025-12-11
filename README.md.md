SISTEMA DE MANUTENÇÃO DE EQUIPAMENTOS
=====================================================================================
Projeto Integrador - BANCO DE DADOS
-------------------------------------------------------------------------------------
EQUIPE:
=====================================================================================
Luis Guilherme Farias dos Santos,
Victor Stangl Von Czekus,
Pedro Hugo Ribeiro Rocha,
Isaac Fernando Pedroza Gomez,
Thales Factum Freitas

-------------------------------------------------------------------------------------
OBJETIVO DO PROJETO:
=====================================================================================
Fazer um sistema que consiga gerenciar e otimizar as atividades da empresa TechMec.

-------------------------------------------------------------------------------------
CONTEÚDO DA PASTA CONTENDO O PROJETO:
=====================================================================================
DER.png,
script.sql,
insert.sql,
consultas.sql,
README.md

-------------------------------------------------------------------------------------
ENTIDADES PRINCIPAIS
=====================================================================================
Usuário(classe pai),
Técnico(herda de usuário),
Gerente(herda de usuário),
Coordenador(herda de usuário),
Equipamento,
Ordem Serviço,
Registro Historico,
Relatório Desempenho

-------------------------------------------------------------------------------------
CARDINALIDADE
=====================================================================================
Usuario 1-1 Tecnico, Gerente, Coordenador.
Coordenador 1:N Relatorio Desempenho.
Gerente 1:N Manutencao Preventiva.
Tecnico 1:N Equipamento.
Equipamento 1-N Ordem Serviço. 
Manutencao Preventiva 1-N Registro Historico.
Relatorio Desempenho 1-N Registro Historico.

--------------------------------------------------------------------------------------
COMO RODAR O BANCO
======================================================================================
Primeiramente abra o MySQL Workbench, crie uma conexão e em seguida import o script.sql; depois importe o insert.sql para vermos a query aonde está os comandos de inserir dados; depois importe o controle.sql que é para mostrar a query aonde estão as permissões, alterações, drops e alterações da tabela e por fim importe as consultas para ver a query de consultas, também para poder executar os comandos e ver as informações das tabelas.

