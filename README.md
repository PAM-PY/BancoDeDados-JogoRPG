# Projeto de Banco de Dados — Jogo RPG

Atividade do SENAI: criação das tabelas de um projeto de jogo RPG online utilizando SQL Server.

## Arquivo

- `JogoRPG.sql`: script SQL para criar o banco de dados `JogoRPG` e suas cinco tabelas.

## Estrutura do banco

1. **USUARIOS** — UsuarioId (PK), Email, Senha.
2. **PERSONAGENS** — PersonagemId (PK), NomePersonagem, UsuarioId (FK), ClasseId (FK).
3. **CLASSES** — ClasseId (PK), Nome, Descricao.
4. **HABILIDADES** — HabilidadeId (PK), Nome.
5. **CLASSES_HABILIDADES** — ClasseId (PK/FK), HabilidadeId (PK/FK).

## Relacionamentos

- USUARIOS 1:N PERSONAGENS.
- CLASSES 1:N PERSONAGENS.
- CLASSES N:N HABILIDADES, resolvido pela tabela associativa CLASSES_HABILIDADES.

## Como executar

1. Abra o SQL Server Management Studio (SSMS).
2. Conecte-se à instância do SQL Server instalada no computador.
3. Clique em **New Query (Nova Consulta)**.
4. Abra `JogoRPG.sql`, copie o conteúdo e cole na janela de consulta.
5. Clique em **Execute (Executar)** ou pressione F5.
6. No painel Object Explorer, atualize **Databases** e confira o banco `JogoRPG` e suas tabelas.

## Observação

O diagrama fornecido informa os nomes dos campos e os relacionamentos, mas não especifica os tamanhos dos campos de texto. Por isso, foram adotados tamanhos `VARCHAR` para os campos textuais. O script cria a estrutura; não inclui registros de exemplo.
