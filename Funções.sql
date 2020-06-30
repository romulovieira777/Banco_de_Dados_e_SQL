/* Escolhendo um Banco de Dados */
USE
	EMPRESA
GO


/* Fun��es de Convers�o de Dados */
SELECT
	CAST('1' AS INT) + CAST('1' AS INT)
GO


/* Convertendo para o Padr�o Brasileiro de Data */
SELECT
	NOME,
	CAST(DAY(NASCIMENTO) AS VARCHAR) + '/' + 
	CAST(MONTH(NASCIMENTO) AS VARCHAR) + '/' + 
	CAST(YEAR(NASCIMENTO) AS VARCHAR) AS NASCIMENTO
FROM
	ALUNO
GO


/* Charindex - Retorna um Inteiro */
SELECT
	NOME,
	CHARINDEX('A', NOME) AS INDICE -- Quando n�o passamos o terceiro par�metro o default 1
FROM
	ALUNO
GO


SELECT
	NOME,
	CHARINDEX('A', NOME, 2) AS INDICE
FROM
	ALUNO
GO


/* Bulk Insert - Importa��o de Arquivos */
BULK INSERT
	LANCAMENTO_CONTABIL
FROM
	'Z:\CONTAS.txt'
WITH
(
	FIRSTROW = 2,
	DATAFILETYPE = 'char',
	FIELDTERMINATOR = '\t', --\t = TAB
	ROWTERMINATOR = '\n' --\n = ENTER
)
GO


/* Criando uma Tabela */
CREATE TABLE LANCAMENTO_CONTABIL (
	CONTA INT,
	VALOR INT,
	DEB_CRED CHAR(1)
)
GO


/* Selecionando uma Tabela */
SELECT
	*
FROM
	LANCAMENTO_CONTABIL
GO


SELECT
	CONTA,
	VALOR,
	DEB_CRED,
	CHARINDEX('D', DEB_CRED) AS DEBITO,
	CHARINDEX('C', DEB_CRED) AS CREDITO,
	CHARINDEX('C', DEB_CRED) * 2 - 1 AS MULTIPLICADOR
FROM
	LANCAMENTO_CONTABIL
GO


SELECT
	CONTA,
	SUM(VALOR * (CHARINDEX('C', DEB_CRED) * 2 - 1)) AS SALDO
FROM
	LANCAMENTO_CONTABIL
GROUP BY
	CONTA
GO