/* Escolhendo um Banco de Dados */
USE
	EMPRESA
GO


/* Datas - Datediff - Calculando a Difernça entre Duas Datas */
SELECT
	NOME,
	GETDATE() AS DIA_HORA
FROM
	ALUNO
GO


SELECT
	NOME,
	DATEDIFF(DAY, NASCIMENTO, GETDATE()) AS IDADE
FROM
	ALUNO
GO


/* Retorno em Inteiro + Operação Matemática */
SELECT
	NOME,
	(DATEDIFF(DAY, NASCIMENTO, GETDATE()) / 365) AS IDADE
FROM
	ALUNO
GO


SELECT
	NOME,
	(DATEDIFF(MONTH, NASCIMENTO, GETDATE()) / 12) AS IDADE
FROM
	ALUNO
GO


SELECT
	NOME,
	DATEDIFF(YEAR, NASCIMENTO, GETDATE()) AS IDADE
FROM
	ALUNO
GO


/* Datename - Traz o Nome da parte em Questão */
SELECT
	NOME,
	DATENAME(MONTH, NASCIMENTO)
FROM
	ALUNO
GO


SELECT
	NOME,
	DATENAME(YEAR, NASCIMENTO)
FROM
	ALUNO
GO


SELECT
	NOME,
	DATENAME(WEEKDAY, NASCIMENTO)
FROM
	ALUNO
GO


/* Datepart - Porém o Retorno é Inteiro */
SELECT
	NOME,
	DATEPART(MONTH, NASCIMENTO),
	DATENAME(MONTH,NASCIMENTO)
FROM
	ALUNO
GO


/* Dateadd - Retorna uma Data Somando a outra Data */
SELECT
	DATEADD(DAY, 365, GETDATE())


SELECT
	DATEADD(YEAR, 10, GETDATE())