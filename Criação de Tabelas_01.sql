/* Escolhendo um Banco de Dados */
USE
	EMPRESA
GO


/* Criando uma Tabela */
CREATE TABLE ALUNO (
	IDALUNO INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR(1) NOT NULL,
	NASCIMENTO DATE NOT NULL,
	EMAIL VARCHAR(30) UNIQUE
)
GO


/* Constraints */
ALTER TABLE
	ALUNO
ADD CONSTRAINT
	CK_SEXO
		CHECK (SEXO IN('M', 'F'))
GO


/* Relacionamento 1 x 1*/

/* Ciando uma Tabela*/
CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY IDENTITY (100, 10),
	BAIRO VARCHAR(30),
	UF CHAR(2) NOT NULL
	CHECK (UF IN('RJ', 'SP', 'SP')),
	ID_ALUNO INT UNIQUE
)
GO


/* Criando a Chave Estrangeira */
ALTER TABLE
	ENDERECO
ADD CONSTRAINT
	FK_ENDERECO_ALUNO
FOREIGN KEY
	(ID_ALUNO)
REFERENCES
	ALUNO(IDALUNO)
GO


/* Comandos de Descrição */
SP_COLUMNS
	ALUNO
GO


SP_HELP
	ALUNO
GO


/* Inserindo Dados na Tabela */
INSERT INTO
	ALUNO
VALUES (
	'ANDRE',
	'M',
	'1981/12/09',
	'ANDRE@IG.COM'
)


INSERT INTO
	ALUNO
VALUES (
	'ANA',
	'F',
	'1978/03/09',
	'ANA@IG.COM'
)


INSERT INTO
	ALUNO
VALUES (
	'RUI',
	'M',
	'1951/07/09',
	'RUI@IG.COM'
)


INSERT INTO
	ALUNO
VALUES (
	'JOAO',
	'M',
	'2002/11/09',
	'JOAO@IG.COM'
)
GO


/* Selecionando uma Tabela */
SELECT
	*
FROM
	ALUNO
GO