CREATE DATABASE TechMec;
USE TechMec;

-- Tabela para Usuário
CREATE TABLE usuario (
    id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    login VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Tabela para Técnico
CREATE TABLE tecnico (
    id_usuario BIGINT PRIMARY KEY,
    registro_profissional VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabela para Coordenador
CREATE TABLE coordenador (
    id_usuario BIGINT PRIMARY KEY,
    area_responsavel VARCHAR(150),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabela para Gerente
CREATE TABLE gerente (
    id_usuario BIGINT PRIMARY KEY,
    nivel_gerencia VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabela para Equipamentos
CREATE TABLE equipamento (
    id_equipamento BIGINT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(100) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL,
    fabricante VARCHAR(150),
    setor VARCHAR(100),
    data_aquisicao DATE
);

-- Tabela para Ordem Serviço
CREATE TABLE ordem_servico (
	id_os BIGINT AUTO_INCREMENT PRIMARY KEY,
    
    -- Dados principais
    tipo_os VARCHAR(60) NOT NULL,
    prioridade VARCHAR(50),
    status_atual VARCHAR(50) NOT NULL,
    descricao TEXT,
    
    -- Datas
    data_abertura DATETIME,
    data_encerramento DATETIME,
    
    -- Relacionamentos
    id_equipamento BIGINT NOT NULL,
    id_tecnico_responsavel BIGINT,
    id_tecnico_solucionador BIGINT,
    
    -- Chaves Estrangeiras
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento),
    FOREIGN KEY (id_tecnico_responsavel) REFERENCES tecnico(id_usuario),
    FOREIGN KEY (id_tecnico_solucionador) REFERENCES tecnico(id_usuario)
);

-- Tabela para Registro Historico
CREATE TABLE registro_historico (
    id_registro BIGINT AUTO_INCREMENT PRIMARY KEY,
    data_evento DATETIME NOT NULL,
    tipo_acao VARCHAR(50),
    detalhes TEXT,
    id_os BIGINT NOT NULL,
    id_usuario BIGINT NOT NULL,
    FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Tabela para Relatório Desempenho
CREATE TABLE relatorio_desempenho (
    id_relatorio BIGINT AUTO_INCREMENT PRIMARY KEY,
    periodo_referencia VARCHAR(100) NOT NULL,
    dados_resumo TEXT,
    versao INT DEFAULT 1,
    id_gerente BIGINT NOT NULL,
    FOREIGN KEY (id_gerente) REFERENCES gerente(id_usuario)
);

CREATE TABLE manutencao_preventiva(
	id_manutencao BIGINT AUTO_INCREMENT PRIMARY KEY,
    data_agendada VARCHAR(50),
    data_conclusao VARCHAR(50),
    executada VARCHAR(50),
    FOREIGN KEY (id_manutencao) REFERENCES tecnico(id_usuario)
    );
