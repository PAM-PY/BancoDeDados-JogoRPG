-- SENAI - ATIVIDADE: CRIAR AS TABELAS DO PROJETO DE JOGO RPG ONLINE
-- SGBD: Microsoft SQL Server
-- Objetivo: criar o banco de dados e as tabelas conforme o diagrama fornecido.

-- 1. Criacao do banco de dados
IF DB_ID('JogoRPG') IS NULL
BEGIN
    CREATE DATABASE JogoRPG;
END;
GO

-- 2. Selecao do banco de dados
USE JogoRPG;
GO

-- 3. Tabela USUARIOS
CREATE TABLE USUARIOS
(
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(120) NOT NULL,
    Senha VARCHAR(120) NOT NULL
);
GO

-- 4. Tabela CLASSES
CREATE TABLE CLASSES
(
    ClasseId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(120) NOT NULL,
    Descricao VARCHAR(255)
);
GO

-- 5. Tabela HABILIDADES
CREATE TABLE HABILIDADES
(
    HabilidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(120) NOT NULL
);
GO

-- 6. Tabela PERSONAGENS
-- Cada personagem pertence a um usuario e a uma classe.
CREATE TABLE PERSONAGENS
(
    PersonagemId INT IDENTITY(1,1) PRIMARY KEY,
    NomePersonagem VARCHAR(120) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES USUARIOS(UsuarioId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId)
);
GO

-- 7. Tabela CLASSES_HABILIDADES
-- Tabela associativa do relacionamento N:N entre CLASSES e HABILIDADES.
-- A chave primaria composta impede a repeticao do mesmo par classe/habilidade.
CREATE TABLE CLASSES_HABILIDADES
(
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,
    PRIMARY KEY (ClasseId, HabilidadeId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId),
    FOREIGN KEY (HabilidadeId) REFERENCES HABILIDADES(HabilidadeId)
);
GO

-- 8. Consulta para conferir as tabelas criadas
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
