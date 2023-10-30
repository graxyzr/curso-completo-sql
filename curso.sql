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
ORDER BY ListPrice DESC;

-- DESAFIO 10
-- OBTER O NOME E NUMERO DO PRODUTO DOS PRODUTOS QUE TEM O productId entre 1~4
SELECT TOP 4 name, productNumber
FROM production.Product
ORDER BY productId ASC;




-- AULA 7: BETWEEN
-- BETWEEN: É USADO PARA ENCONTRAR VALOR ENTRE UM VALOR MÍNIMO E VALOR MÁXIMO
-- valor BETWEEN mínimo AND máximo;
SELECT *
FROM production.Product
WHERE ListPrice BETWEEN 1000 AND 1500;

-- LISTA O OPOSTO
SELECT *
FROM production.Product
WHERE ListPrice NOT BETWEEN 1000 AND 1500;

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009-01-01' AND '2010-01-01';
ORDER BY HireDate;




-- AULA 8: IN
-- O OPERADOR 'IN' É USADO JUNTAMENTE AO WHERE!
-- PARA VERIFICAR SE UM VALOR CORRESPONDEM COM QUALQUER VALOR PASSADO NA LISTA DE VALORES
-- valor IN (valor1, valor2)
-- valor IN (SELECT valor FROM nomeDaTabela)
SELECT *
FROM person.Person
WHERE BusinessEntityID IN (2, 7, 13);

-- ACIMA MOSTRA UMA MANEIRA SIMPLIFICADA COM O COMANDO IN

SELECT *
FROM person.Person
WHERE BusinessEntityID = 2 OR BusinessEntityID = 7 OR BusinessEntityID = 13;




-- AULA 9: LIKE
SELECT *
FROM person.Person
WHERE FirstName LIKE 'ovi%';

SELECT *
FROM person.Person
WHERE FirstName LIKE '%to';

SELECT *
FROM person.Person
WHERE FirstName LIKE '%essa%';

-- AQUI SUBSTITUI APENAS UM CARACTERE
SELECT *
FROM person.Person
WHERE FirstName LIKE '%ro_';

SELECT *
FROM person.Person
WHERE FirstName LIKE '%rO_';




-- AULA 10: DESAFIOS FUNDAMENTOS SQL
-- QUANTOS PRODUTOS TEMOS CADASTRADO NO SISTEMA QUE CUSTAM MAIS QUE 1500 DÓLARES?
-- TERÁ QUE USAR A TABELA production.Product
-- TERÁ QUE USAR COUNT E WHERE E MAIS ALGUM OPERADOR QUE COMPARAÇÃO
SELECT COUNT (ListPrice)
FROM production.Product
WHERE ListPrice > 1500;

-- QUANTAS PESSOAS TEMOS COM O SOBRENOME QUE INICIA COM A LETRA P?
-- TERÁ QUE USAR A TABELA person.Person
-- TERÁ QUE USAR O COUNT, WHERE E LIKE
SELECT COUNT(LastName)
FROM person.Person
WHERE LastName LIKE 'p%';

-- EM QUANTAS CIDADES ÚNICAS ESTÃO CADASTRADOS NOSSOS CLIENTES?
-- TERÁ QUE USAR A TABELA person.Person
-- TERÁ QUE USAR COUNT, DISTINCT
SELECT COUNT(DISTINCT(city))
FROM person.Address;

-- QUAIS SÃO AS CIDADES ÚNICAS QUE TEMOS CADASTRADOS EM NOSSO SISTEMA?
-- TERÁ QUE USAR A TABELA person.Address
-- SERÁ BEM SIMILAR A RESPOSTA ANTERIOR
SELECT DISTINCT(city)
FROM person.Address;

-- QUANTOS PRODUTOS VERMELHOS TEM PREÇO ENTRE 500 A 1000 DÓLARES?
-- TERÁ QE USAR A TABELA production.Product
-- TERÁ QUE USAR WHERE, BETWEEN
SELECT COUNT(*)
FROM production.Product
WHERE color = 'red'
AND ListPrice BETWEEN 500 AND 1000;

-- QUANTOS PRODUTOS CADASTRADOS TEM A PALAVRA 'road' NO NOME DELES?
-- TERÁ QUE USAR A TABELA production.Product
-- TERÁ QUE USAR COUNT, LIKE
SELECT COUNT(*)
FROM production.Product
WHERE name LIKE '%road%';




-- AULA 11: MIN MAX SUM AVG
-- FUNÇÕES DE AGREGAÇÃO BASICAMENTE AGREGAM OU COMBINAM DADOS DE UMA TABELA EM 1 RESULTADO SÓ
-- SUM: SOMA DE COLUNAS
-- MIN: MENOR VALOR DAS COLUNAS
-- MAX: MAIOR VALOR DAS COLUNAS
-- AVG: MÉDIA DOS VALORES DAS COLUNAS

SELECT TOP 10 *
FROM Sales.SalesOrderDetail;

-- RETORNARÁ O TOTAL DE TODAS AS COLUNAS DE 'linetotal'
SELECT TOP 10 SUM(linetotal)
FROM Sales.SalesOrderDetail;

-- RETORNARÁ O TOTAL DE TODAS AS COLUNAS DE 'linetotal' NOMEADO COMO 'Soma'
SELECT TOP 10 SUM(linetotal) AS "Soma"
FROM Sales.SalesOrderDetail;

-- RETORNARÁ O MENOR VALOR CADASTRADO NA COLUNA DE 'LINEtotal'
SELECT TOP 10 MIN(LINEtotal)
FROM Sales.SalesOrderDetail;

-- RETORNARÁ O MAIOR VALOR CADASTRADO NA COLUNA DE 'LINEtotal'
SELECT TOP 10 MAX(LINEtotal)
FROM Sales.SalesOrderDetail;

-- RETORNARÁ A MÉDIA DA COLUNA DE 'LINEtotal'
SELECT TOP 10 AVG(LINEtotal)
FROM Sales.SalesOrderDetail;




-- AULA 12: GROUP BY + DESAFIOS (INTERMEDIÁRIO)
-- GROUP BY: DIVIDE O RESULTADO DA SUA PESQUISA EM GRUPOS
-- PARA CADA GRUPO VOCÊ PODE APLICAR UM FUNÇÃO DE AGREGAÇÃO, POR EXEMPLO:
-- CALCULAR A SOMA DE ITENS
-- CONTAR O NÚMERO DE ITENS NAQUELE GRUPO
SELECT coluna1, funcaoAgregacao(coluna2)
FROM nomeDaTabela
GROUP BY coluna1;

SELECT * 
FROM Sales.SalesOrderDetail;

SELECT SpecialOfferID, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID;

SELECT SpecialOfferID, UnitPrice
FROM Sales.SalesOrderDetail
WHERE SpecialOfferID = 9;

-- VAMOS DIZER QUE EU QUERO SABER QUANTOS CADA PRODUTO FOI VENDIDO ATÉ HOJE
SELECT * FROM Sales.SalesOrderDetail;

-- AGRUPOU TODOS OS PRODUTOS DE 707 E QUANTAS VEZES ELE APARECE NO BANCO DE DADOS
SELECT ProductId, COUNT(ProductId) AS "CONTAGEM"
FROM Sales.SalesOrderDetail
GROUP BY ProductId;

-- VAMOS DIZER QUE EU QUERO SABER QUANTOS NOMES DE CADA NOME TEMOS CADASTRADO EM NOSSO BANCO DE DADOS
SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName;

-- NA TABELA production.product EU QUERO SABER A MÉDIA DE PREÇO PARA OS PRODUTOS QUE SÃO PRATAS (silver)
SELECT color, AVG(ListPrice) "PREÇO"
FROM Production.Product
WHERE color = 'Silver'
GROUP BY color;

-- DESAFIO 11
-- EU PRECISO SABER QUANTAS PESSOAS TEM O MESMO MiddleName AGRUPADAS POR O MiddleName
-- DICAS:
-- TABELA Person.Person
-- USAR GROUP BY E UMA FUNÇÃO DE AGREGAÇÃO
SELECT MiddleName, COUNT(MiddleName) AS "quantidade"
FROM Person.Person
GROUP BY MiddleName
ORDER BY MiddleName;

-- EU PRECISO SABER EM MÉDIA QUAL É A QUANTIDADE (quantity) QUE CADA PRODUTO É VENDIDO NA LOJA.
-- DICAS:
-- TABELA Sales.SalesOrderDetail
-- USAR GROUP BY E UMA FUNÇÃO DE AGREGAÇÃO
SELECT ProductID, AVG(OrderQty) "media"
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

-- EU QUERO SABER QUAL FORAM AS 10 VENDAS QUE NO TOTAL TIVERAM OS MAIORES VALORES DE VENDA (line total) POR PRODUTO DO MAIOR VALOR PARA O MENOR
-- DICAS:
-- TABELA Sales.SalesOrderDetail
-- USAR GROUP BY E UMA FUNÇÃO DE AGREGAÇÃO
-- SE ATENTAR A POR O QUE VOCÊ ESTÁ ORDENANDO
SELECT TOP 10 ProductID, SUM(linetotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(linetotal) DESC;

-- EU PRECISO SABER QUANTOS PRODUTOS E QUAL A QUANTIDADE MÉDIA DE PRODUTOS TEMOS CADASTRADOS NAS NOSSAS ORDEM DE SERVIÇO (WorkOrder), AGRUPADOS POR ProductID
-- DICAS:
-- TABELA production.workorder
-- USAR GROUP BY E UMA FUNÇÃO DE AGREGAÇÃO
SELECT ProductID, COUNT(ProductID) "contagem"
AVG(OrderQty) AS "media"
FROM Production.WorkOrder
GROUP BY ProductID;




-- AULA 13: HAVING + DESAFIOS
-- O HAVING É BASICAMENTE MUITO UTILIZADO EM JUNÇÃO COM O GROUP BY PARA FILTRAR RESULTADOS DE UM AGRUPAMENTO
-- É BASICAMENTE UM WHERE PARA DADOS AGRUPADOS
SELECT coluna1, funcaoAgregacao(coluna2)
FROM nomeTabela
GROUP BY coluna1
HAVING condicao;

-- A DIFERENÇA ENTRE HAVING E WHERE É:
-- O GROUP BY É APLICADO DEPOIS QUE OS DADOS JÁ FORAM AGRUPADOS, ENQUANTO O WHERE É APLICADO ANTES DOS DADOS SEREM AGRUPADOS

-- VAMOS DIZER QUE QUEREMOS SABER QUAIS NOMES NO SISTEMA TEM UMA OCORRÊNCIA MAIOR QUE 10 VEZES
SELECT FirstName, COUNT(FirstNamed) AS "quantidade"
FROM person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10;

SELECT TOP 10 *
FROM Sales.SalesOrderDetail;

SELECT productid, SUM(linetotal) AS "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(linetotal) BETWEEN 162000 AND 500000;

-- VOCÊ QUER SABER QUAIS NOMES NO SISTEMA TEM UMA OCORRÊNCIA MAIOR QUE 10 VEZES, PORÉM SOMENTE ONDE O TÍTULO É 'Mr.'
SELECT FirstName, COUNT(FirstNamed) AS "quantidade"
FROM person.Person
WHERE Title = 'Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10;

-- DESAFIO 12
-- 1. ESTAMOS QUERENDO IDENTIFICAR AS PROVÍNCIAS (stateProvinceId) COM O MAIOR NÚMERO DE CADASTROS NO NOSSO SISTEMA, ENTÃO É PRECISO ENCONTRAR QUAIS PROVÍNCIAS (stateProvinceId) ESTÃO REGISTRADAS NO BANCO DE DADOS MAIS QUE 1000 VEZES
-- DICAS:
-- TABELA person.address
-- USAR HAVING, COUNT, E OPERADORES MATEMÁTICOS
SELECT StateProvinceID, COUNT(stateprovinceid) AS "quantidade"
FROM person.Address
GROUP BY StateProvinceID
HAVING COUNT(stateprovinceid) > 1000;

-- 2. SENDO QUE SE TRATA DE UMA MULTINACIONAL OS GERENTES QUEREM SABER QUAIS PRODUTOS (productId) não estão trazendo em média no mínimo 1 milhão em total de vendas (lineTotal)
-- DICAS:
-- TABELA sales.salesorderdetail
-- USAR HAVING, COUNT, E OPERADORES MATEMÁTICOS
SELECT ProductID, AVG(linetotal)
FROM sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(linetotal) < 1000000;




-- AULA 14: AS + DESAFIOS
-- O AS PODE NOMEAR COLUNAS
SELECT TOP 10 ListPrice AS "Preço do Produto"
FROM Production.Product;

SELECT TOP 10 AVG(ListPrice) AS "Preço Médio"
FROM Production.Product;

-- 1. ENCONTRAR O FirstName E LastName person.person
SELECT TOP 10 FirstName AS "Nome", LastName AS "Sobrenome"
FROM person.person;

-- 2. ProductNumber DA TABELA production.product "Número do Produto"
SELECT TOP 10 ProductNumber AS "Número do Produto"
FROM Production.Product;

-- 3. sales.salesorderdetail unitPrice "Preço Unitário"
SELECT unitPrice AS "Preço Unitário"
FROM sales.SalesOrderDetail;




-- AULA 15: INNER JOIN + DESAFIOS
-- O INNER JOIN COMPARA CADA LINHA DA TABELA A COM AS LINHAS DA TABELA B PARA ENCONTRAR TODOS OS PARES DE LINHAS QUE SATISFAZEM A CONDIÇÃO DE JUNÇÃO
-- EXISTEM TRÊS TIPOS GERAIS DE JOINS:
-- - INNER JOIN
-- - OUTER JOIN
-- - SELF-JOIN
SELECT C.ClienteId, C.Nome, E.Rua, E.Cidade
FROM Cliente C
INNER JOIN Endereco E ON E.EnderecoId = C.EnderecoId;

-- BusinessEntityId, FirstName, LastName, EmailAddress
SELECT p.BusinessEntityID, p.FirstName, p.LastName, pe.EmailAddress
FROM Person.Person AS P
INNER JOIN Person.EmailAddress PE ON p.BusinessEntityID = pe.BusinessEntityID;

-- VAMOS DIZER QUE NÓS QUEREMOS OS NOMES DOS PRODUTOS E AS INFORMAÇÕES DE SUAS SUBCATEGORIAS
-- ListPrice, Nome do Produto, Nome da Subcategoria
SELECT pr.ListPrice, pr.Name, pc.Name
FROM Production.Product Pr
INNER JOIN Production.ProductSubcategory PC ON PC.ProductSubcategoryID = pr.ProductSubcategoryID;

-- JUNTAR INFORMAÇÕES DE UMA TABELA COM OUTRA
SELECT TOP 10 *
FROM Person.BusinessEntityAddress;

SELECT TOP 10 *
FROM Person.Address;

SELECT TOP 10 *
FROM Person.BusinessEntityAddress BA
INNER JOIN Person.Address PA ON PA.AddressID = BA.AddressID;

-- DESAFIO 13
SELECT TOP 10 *
FROM person.PhoneNumberType;

SELECT TOP 10 *
FROM person.PersonPhone;

-- QUERO QUE INCLUA:
-- BusinessEntityId, Name, PhoneNumberTypeId, PhoneNumber
SELECT pp.BusinessEntityId, pt.name, pt.PhoneNumberTypeId, pp.PhoneNumber
FROM person.PersonPhone PP
INNER JOIN Person.PhoneNumberType PT ON PT.PhoneNumberTypeID = pp.PhoneNumberTypeID;


SELECT TOP 10 *
FROM person.stateprovince;

SELECT TOP 10 *
FROM person.address;

-- QUERO QUE INCLUA:
-- AddressId, City, StateProvinceId, Nome do Estado
SELECT TOP 10 PA.AddressID, PA.City, PS.StateProvinceID, PS.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince PS ON PS.StateProvinceID = PA.StateProvinceID;




-- AULA 17: TIPOS DE JOINS
-- INNER JOIN RETORNA APENAS OS RESULTADOS QUE CORRESPONDEM (EXISTEM) TANTO NA TabelaA COMO TabelaB
SELECT * FROM TabelaA
INNER JOIN TabelaB
ON TabelaA.nome = TabelaB.nome;

-- FULL OUTER JOIN RETORNA UM CONJUNTO DE TODOS REGISTROS CORRESPONDENTES DA TabelaA E TabelaB QUANDO SÃO IGUAIS. E ALÉM DISSO SE NÃO HOUVER VALORES CORRESPONDENTES, ELE SIMPLESMENTE IRÁ PREENCHER ESSE LADO COM "null"
SELECT * FROM TabelaA
FULL OUTER JOIN TabelaB
ON TabelaA.nome = TabelaB.nome;

-- LEFT OUTER JOIN RETORNA UM CONJUNTO DE TODOS OS REGISTROS DA TabelaA, E ALÉM DISSO, OS REGISTROS CORRESPONDENTES (QUANDO DISPONÍVEIS) NA TabelaB. SE NÃO HOUVER REGISTROS CORRESPONDENTES ELE SIMPLESMENTE VAI PREENCHER COM "null"
SELECT * FROM TabelaA
LEFT JOIN TabelaB
ON TabelaA.nome = TabelaB.nome;




-- AULA 18: OUTER JOIN
-- LEFT OUTER JOIN === LEFT JOIN

-- QUERO DESCOBRIR QUAIS PESSSOAS TEM UM CARTÃO DE CRÉDITO REGISTRADO
SELECT *
FROM Person.Person PP
INNER JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID;
-- INNER JOIN: 19118 LINHAS

SELECT *
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID;
-- LEFT JOIN: 19972 LINHAS
-- EXTRAI TABELAS QUE NÃO POSSUEM DADOS PREENCHIDOS DENTRO DELA

-- DIFERENÇA ENTRE OS DOIS
SELECT 19972 = 19118;

SELECT *
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL;




-- AULA 19: UNION
-- O OPERADOR UNION COMBINA DOIS OU MAIS RESULTADOS DE UM SELECT EM UM RESULTADO APENAS
SELECT coluna1, coluna2
FROM tabela1
UNION
SELECT coluna1, coluna2
FROM tabela2

SELECT [ProductID], [Name], [ProductNumber]
FROM Production.Product
WHERE Name LIKE '%Chain%'
UNION
SELECT [ProductID], [Name], [ProductNumber]
FROM Production.Product
WHERE Name LIKE '%Decal%'

SELECT FirstName, Title
FROM person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title
FROM Person.Person
WHERE MiddleName = 'A'
-- ELE JUNTA TODAS AS INFORMAÇÕES EM APENAS UM RESULTADO




-- AULA 20: SELF JOIN + DESAFIO
-- SELF JOIN: SÃO JUNÇÕES DE UMA TABELA COM ELA MESMA
SELECT NOME_COLUNA
FROM TABELA A, TABELA B
WHERE CONDICAO;

SELECT *
FROM CUSTOMERS;

-- EU QUERO TODOS OS CLIENTES QUE MORAM NA MESMA REGIÃO
SELECT *
FROM CUSTOMERS
WHERE region = region
-- NÃO FUNCIONA ASSIM!!!!

-- PODE SER ASSIM
SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM CUSTOMERS A, CUSTOMERS B
WHERE A.Region = B.Region;

-- EU QUERO ENCONTRAR (NOME E DATA DE CONTRATAÇÃO) DE TODOS OS FUNCIONÁRIOS QUE FORAM CONTRATADOS NO MESMO ANO
SELECT A.firstname, A.hiredate, b.firstname, b.hiredate
FROM Employees A, Employees B
WHERE DATEPART(YEAR, A.hiredate) = DATEPART(YEAR, b.hiredate);

-- DESAFIO 14
-- EU QUERO SABER NA TABELA DETALHE DO PEDIDO [Order Details] QUAIS PRODUTOS TEM O MESMO PERCENTUAL DE DESCONTO
SELECT A.productId, A.Discount, B.productId, b.Discount
FROM [Order Details] A, [Order Details] B
WHERE A.Discount = B.Discount;




-- AULA 21: SUBQUERY
-- ...
