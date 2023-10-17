-- AULA 1: SELECT + DESAFIO
SELECT
-- SQL Server, Postgres, Oracle, mySQL

SELECT coluna1, coluna2
FROM tabela;

SELECT *
FROM tabela;

-- DESAFIO 1
-- EQUIPE DE MARKETING PRECISA FAZER UMA PESQUISA SOBRE NOMES MAIS COMUNS DE SEUS CLIENTES E PRECISA DO NOME E SOBRENOME DE TODOS OS CLIENTES QUE ESTÃO CADASTRADOS NO SISTEMA.
SELECT FirstName, LastName
FROM person.Person;




-- AULA 2: DISTINCT + DESAFIO
SELECT DISTINCT coluna1, coluna2
FROM tabela;
-- DISTINCT: RETORNA APENAS OS DADOS ÚNICOS DE UMA TABELA

-- DESAFIO 2
-- QUANTOS NOMES SOBRENOMES ÚNICOS TEMOS EM NOSSA TABELA Person.Person?
SELECT DISTINCT LastName
FROM person.Person;




-- AULA 3: WHERE + DESAFIO
SELECT coluna1, coluna2, coluna_n
FROM tabela
WHERE condicao;

-- COMENTÁRIOS NO SQL PODEM SER FEITOS COM "--" OU "/* */"

/* 

OPERADOR    -   DESCRIÇÃO
=               IGUAL
>               MAIOR QUE
<               MENOR QUE
>=              MAIOR QUE OU IGUAL
<=              MENOR QUE OU IGUAL
<>              DIFERENTE DE
AND             OPERADOR LÓGICO E
OR              OPERADOR LÓGICO OU

*/

SELECT *
FROM person.Person
WHERE LastName = 'Miller' AND FirstName = 'Anna';

SELECT *
FROM production.Product
WHERE color = 'blue' OR color = 'black';

SELECT *
FROM production.Product
WHERE ListPrice > 1500;

SELECT *
FROM production.Product
WHERE ListPrice > 1500 AND ListPrice < 5000;

SELECT *
FROM production.Product
WHERE color <> 'red';

-- DESAFIO 3
-- EQUIPE DE PRODUÇÃO DE PRODUTOS PRECISA DO NOME DE TODAS AS PEÇAS QUE PESAM MAIS QUE 500kg MAS NÃO MAIS QUE 700kg PARA INSPEÇÃO
SELECT Name
FROM Production.Product
WHERE Weight > 500 AND Weight <= 700;

-- DESAFIO 4
-- FOI PEDIDO PELO MARKETING UMA RELAÇÃO DE TODOS OS EMPREGADOS (EMPLOYEES) QUE SÃO CASADOS (SINGLE = SOLTEIRO, MARRIED = CASADO) E SÃO ASALARIADOS (SALARIED)
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'Ms' AND SalariedFlag = 1;

-- DESAFIO 5
-- UM USUÁRIO CHAMADO PETER KREBS ESTÁ DEVENDO UM PAGAMENTO, CONSIGA O EMAIL DELE PARA QUE POSSAMOS ENVIAR UMA COBRANÇA!
-- (TERÁ QUE USAR A TABELA person.Person E DEPOIS A TABELA person.EmailAddress)
SELECT *
FROM person.Person
WHERE FirstName = 'Peter' AND LastName = 'Krebs';

SELECT *
FROM person.EmailAddress
WHERE BusinessEntityID = 26;




-- AULA 4: COUNT + DESAFIO
SELECT COUNT(DISTINCT coluna1)
FROM tabela;
-- COUNT: RETORNA O TOTAL DE LINHAS SELECIONADAS

SELECT COUNT(*)
FROM person.Person;

SELECT COUNT(title)
FROM person.Person;

SELECT COUNT(DISTINCT title)
FROM person.Person;

-- DESAFIO 6
-- EU QUERO SABER QUANTOS PRODUTOS TEMOS CADASTRADOS EM NOSSA TABELA DE PRODUTOS
-- (production.Product)
SELECT COUNT(product)   
FROM production.Product;

-- DESAFIO 7
-- EU QUERO SABER QUANTOS TAMANHOS TEMOS CADASTRADOS EM NOSSA TABELA
SELECT COUNT(size)
FROM production.Product;

-- DESAFIO 8
-- EU QUERO SABER QUANTOS TAMANHOS DIFERENTES DE PRODUTOS TEMOS CADASTRADOS EM NOSSA TABELA
SELECT COUNT(DISTINCT size)
FROM production.Product;




-- AULA 5: TOP
SELECT TOP 10 *
FROM tabela;
-- TOP: ESPECIFICA O NÚMERO DE REGISTROS A RETORNAR




-- AULA 6: ORDER BY + DESAFIO
SELECT coluna1, coluna2
FROM tabela
ORDER BY coluna1 ASC/DESC;
-- ORDER BY: EFETUA A ORDERNAÇÃO EM ORDEM CRESCENTE/DECRESCENTE

SELECT *
FROM person.Person
ORDER BY FirstName ASC;
-- ASC: FORMA CRESCENTE

SELECT *
FROM person.Person
ORDER BY FirstName DESC;
-- DESC: FORMA DECRESCENTE

SELECT *
FROM person.Person
ORDER BY FirstName ASC, LastName DESC;

SELECT FirstName, LastName
FROM person.Person
ORDER BY FirstName ASC, LastName DESC;

SELECT FirstName, LastName
FROM person.Person
ORDER BY MiddleName ASC;

SELECT *
FROM person.Person

-- DESAFIO 9
-- OBTER O productId DOS 10 PRODUTOS MAIS CAROS CADASTRADOS NO SISTEMA, LISTANDO DO MAIS CARO PARA O MAIS BARATO

/*
DICAS:
- TERÁ QUE USAR A TABELA production.Product
- TERÁ QUE USAR O ORDER BY E TOP
- PARA ORDENAR TERÁ QUE USAR O ORDER BY ASC OU DESC DEPENDENDO DO RESULTADO QUE ESTÁ BUSCANDO
 */

SELECT TOP 10 productId
FROM production.Product
ORDER BY listPrice DESC;

-- DESAFIO 10
-- OBTER O NOME E NUMERO DO PRODUTO DOS PRODUTOS QUE TEM O productId entre 1~4
SELECT TOP 4 name, productNumber
FROM production.Product
ORDER BY productId ASC;




-- AULA 7: BETWEEN...