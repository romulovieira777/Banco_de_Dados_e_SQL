/* Escolhendo um Banco de Dados */
USE
	EMPRESA
GO


/* Criando Tabela */
CREATE TABLE PESSOA (
	IDPESSOA INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL CHECK (SEXO IN('M', 'F')),
	NASCIMENTO DATE NOT NULL
)
GO


CREATE TABLE TELEFONE_1 (
	IDTELEFONE INT PRIMARY KEY IDENTITY,
	TIPO CHAR(3) NOT NULL CHECK (TIPO IN('CEL', 'COM')),
	NUMERO CHAR(10) NOT NULL,
	ID_PESSOA INT
)
GO


/* Criando a Chave Estrangeira */
ALTER TABLE
	TELEFONE_1
ADD CONSTRAINT
	FK_TELEFONE_PESSOA
FOREIGN KEY
	(ID_PESSOA)
REFERENCES
	PESSOA (IDPESSOA)
ON
	DELETE CASCADE
GO


/* Inserindo Dados na Tabela */
INSERT INTO
	PESSOA
VALUES (
	'ANTONIO',
	'M',
	'1981-02-13'
)


INSERT INTO
	PESSOA
VALUES (
	'DANIEL',
	'M',
	'1985-03-18'
)


INSERT INTO
	PESSOA
VALUES (
	'CLEIDE',
	'F',
	'1979-10-13'
)


INSERT INTO
	PESSOA
VALUES (
	'MAPFRA',
	'M',
	'1981-02-13'
)


INSERT INTO
	TELEFONE_1
VALUES (
	'CEL',
	'9879008',
	1
)


INSERT INTO
	TELEFONE_1
VALUES (
	'COM',
	'8757909',
	1
)


INSERT INTO	
	TELEFONE_1
VALUES (
	'CEL',
	'9875890',
	2
)


INSERT INTO
	TELEFONE_1
VALUES (
	'CEL',
	'9347689',
	2
)


INSERT INTO
	TELEFONE_1
VALUES (
	'COM',
	'2998689',
	3
)


INSERT INTO
	TELEFONE_1
VALUES (
	'COM',
	'2098978',
	2
)


INSERT INTO
	TELEFONE_1
VALUES (
	'CEL',
	'9008679',
	3
)
GO


/* Criando uma Procedure Estática */
CREATE PROCEDURE
	SOMA
AS
	SELECT
		10 + 10 AS SOMA
GO


/* Executando uma Procedure */
EXEC
	SOMA
GO


/* Criando uma Procedure Dinâmica */
CREATE PROCEDURE
	CONTA
	@NUM1 INT,
	@NUM2 INT
AS
	SELECT
		@NUM1 + @NUM2
GO


/* Executando uma Procedure */
EXEC
	CONTA 90, 78
GO


/* Apagando uma Procedure */
DROP PROCEDURE
	SOMA
GO


/* Criando Procedures em Tabelas */
CREATE PROCEDURE
	TELEFONES @TIPO CHAR(3)
AS
	SELECT
		NOME,
		NUMERO
	FROM
		PESSOA
	INNER JOIN
		TELEFONE_1
	ON
		IDPESSOA = ID_PESSOA
	WHERE
		TIPO = @TIPO
GO


/* Executando uma Procedure */
EXEC
	TELEFONES 'CEL'
GO


EXEC
	TELEFONES 'COM'
GO


/* Criando Procedures com Output */
CREATE PROCEDURE
	GETTIPO @TIPO CHAR(3),
	@CONTADOR INT OUTPUT
AS
	SELECT
		@CONTADOR = COUNT(*)
	FROM
		TELEFONE_1
	WHERE
		TIPO = @TIPO
	GO


/* Criando uma Variável */
DECLARE
	@SAIDA INT
EXEC
	GETTIPO @TIPO = 'CEL',
	@CONTADOR = @SAIDA OUTPUT
SELECT
	@SAIDA
GO


/* Criando Procedure de Cadastro */
CREATE PROCEDURE
	CADASTRO
	@NOME VARCHAR(30),
	@SEXO CHAR(1),
	@NASCIMENTO DATE,
	@TIPO CHAR(3),
	@NUMERO VARCHAR(10)
AS
	DECLARE
		@FK INT
	
	INSERT INTO
		PESSOA
	VALUES (
		@NOME,
		@SEXO,
		@NASCIMENTO
	)

	SET
		@FK = (
			SELECT
				IDPESSOA
			FROM
				PESSOA
			WHERE
				IDPESSOA = @@IDENTITY)

	INSERT INTO
		TELEFONE_1
	VALUES (
		@TIPO,
		@NUMERO,
		@FK
	)
GO


/* Exceutando uma Procedure */
CADASTRO
	'JORGE',
	'M',
	'1981-01-01',
	'CEL',
	'97273822'
GO


/* Selecionando Dados da Tabela */
SELECT
	PESSOA.*,
	TELEFONE_1.*
FROM
	PESSOA
INNER JOIN
	TELEFONE_1
ON
	IDPESSOA = ID_PESSOA
GO