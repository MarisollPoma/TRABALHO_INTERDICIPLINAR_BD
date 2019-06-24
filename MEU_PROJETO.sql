/*PROJETO BD - ONDE O CLIENTE SO DIGITAR SEUS PEDIDOS EXEMPLO
O TIPO DE P�O , QUANTIDADE, (PADARIA)  */


				/* CRIA��O DE BANCO DE DADOS */
				CREATE DATABASE SEU_PEDIDOS;

				USE SEU_PEDIDOS;
				GO

				/* EXCLUIR O BANCO DE DADOS  */
				DROP DATABASE SEU_PEDIDOS;


				/* CRIAC�O DE UMA TABELA CLIENTE O PRINCIPAL  */
				CREATE TABLE CLIENTE 
					(COD_CLIE INT  NOT NULL PRIMARY KEY,
					NM_CLIE VARCHAR(60)NOT NULL);
				GO 

				SELECT * FROM CLIENTE;


				/*  TABELA PRODUTO_PAO */
				CREATE TABLE PRODUTO
					(COD_PROD INT IDENTITY(1,1) NOT NULL  PRIMARY KEY,
					TIPO_PROD VARCHAR(50) ,
					PRECO_UNI_PROD NUMERIC (9,2),
					QTD_PROD NUMERIC(7));
				GO

				SELECT * FROM PRODUTO;

				/*  TABELA PEDIDO */
				CREATE TABLE PEDIDOS
					(COD_PED INTEGER NOT NULL PRIMARY KEY, 
					COD_CLIE INTEGER NOT NULL,
					DT_PEDIDO DATE NOT NULL ,
					TOT_PEDIDO NUMERIC(7),
				CONSTRAINT PEDIDOS_CLIENTE_FK FOREIGN KEY (COD_CLIE) REFERENCES CLIENTE);
				GO 

				SELECT * FROM PEDIDOS;

				/* TABELA ITEM PEDIDO*/ 
				CREATE TABLE ITEM_PEDIDO
					(COD_PED INTEGER		NOT NULL,
					COD_PROD INTEGER			NOT NULL,
					VL_ITEM_PED		NUMERIC(9,2)	NOT NULL,
				CONSTRAINT ITEM_PEDIDO_PEDIDOS_FK FOREIGN KEY (COD_PED) REFERENCES PEDIDOS,
				CONSTRAINT ITEM_PEDIDO_PRODUTO_FK FOREIGN KEY (COD_PROD) REFERENCES PRODUTO);

				GO

				SELECT * FROM ITEM_PEDIDO;

				SELECT *FROM CLIENTE;

				SELECT *FROM PRODUTO;

				SELECT * FROM PEDIDOS;
	
				SELECT * FROM ITEM_PEDIDO;


				/* OS INSERTS  */
				INSERT INTO CLIENTE (COD_CLIE, NM_CLIE)
				 VALUES (1,'Tamires Gon�alves de Oliveira'),
						(2,'Angela de Geltil'),
						(3,'Mariana Augusta de Simom'),
						(4,'Silva Taquena Vargas'),
						(5,'Leonel Changes Cru'),
						(6,'Bruna Almeida de Limom'),
						(7,'Luna Duvas Levalte');
				GO 


		
				INSERT INTO PRODUTO (TIPO_PROD, PRECO_UNI_PROD, QTD_PROD)
								VALUES	('P�o Sarnita',	0.33,20),
										('P�o Maraqueta',0.50,10),
										('P�o Enpanada', 1.50,5),
										('P�o Llaucha',2.00,12),
										('P�o Leite',0.60,15);
				GO 

				INSERT INTO PEDIDOS (COD_PED ,COD_CLIE, DT_PEDIDO, TOT_PEDIDO)
							VALUES (1,1,'2018/05/23',3),
									(2,4,'2019/06/01',2),
									(3,	3,'2019/06/04',1),
									(4,5,'2017/05/25',4),
									(5,7,'2019/05/27',9),
									(6,2,'2019/05/28',5);

				GO

				INSERT INTO ITEM_PEDIDO (COD_PED, COD_PROD, VL_ITEM_PED)
								VALUES  (1,1,0.33),
										(2,2,0.50),
										(3,3,1.50),
										(4,5,0.60),
										(5,4,2.00),
										(6,3,1.50);
				GO


					SELECT *FROM CLIENTE;

					SELECT *FROM PRODUTO;

					SELECT * FROM PEDIDOS;

					SELECT * FROM ITEM_PEDIDO;



					/* ADICIONAR UMA COLUNA */
					ALTER TABLE PRODUTO ADD INGREDIENTE_PAO VARCHAR(200) NULL;

					SELECT * FROM PRODUTO;

					/* EXCLUIR UMA COLUNA  */
					ALTER TABLE PRODUTO DROP COLUMN INGREDIENTE_PAO;

					SELECT * FROM PRODUTO;

					/* EXCLUIR UMA TABELA */
					DROP TABLE ITEM_PEDIDO;

					SELECT * FROM ITEM_PEDIDO;


					/* EXCLUI TODOS OS DADOS  DE UMA TABELA */

					TRUNCATE TABLE ITEM_PEDIDO;

					SELECT * FROM ITEM_PEDIDO;


					/* ATUALIZAR OS DADOS */
						UPDATE PRODUTO
						SET TIPO_PROD= 'ARANI'
						WHERE COD_PROD =5


						SELECT * FROM PRODUTO;


					/* EXCLUI  UM DADO INDICADO DENTRO DE UMA TABELA  */
						DELETE FROM ITEM_PEDIDO  WHERE COD_PROD =5

						SELECT * FROM ITEM_PEDIDO;


				/* AQUI MONSTRARA AS CARACTERES COM INICIAL 'M' DA TABELA CLIENTE COLUNA NM_CLIE */

				SELECT NM_CLIE
				FROM CLIENTE
				WHERE NM_CLIE LIKE 'M%';


	
				/* SELECIONEI TODAS AS COLUNAS TABELA CLIENTE E ORDENEI PELO CAMPO ID_CLIE EM ORDEM DESCRESCENTE */
				SELECT * FROM CLIENTE
				ORDER BY COD_CLIE DESC




				/* SELECIONE TODAS AS COLUNAS DA TABELA PEDIDO 
				COLUNA DT_PED QUE ESTEJA ENTRE   10/02/2019 e 10/05/2019. */

				SELECT * FROM PEDIDOS
				WHERE DT_PEDIDO BETWEEN '2019/05/25' AND '2019-05-28';
		
				SELECT * FROM  PEDIDOS



				/*  SUBQUERY ,JOIN OU INNER JOIN */
				SELECT DISTINCT NM_CLIE,
				(SELECT MAX(TOT_PEDIDO) FROM PEDIDOS
				 WHERE PEDIDOS.COD_CLIE = CLIENTE.COD_CLIE) AS OS_PEDIDOS
				 FROM CLIENTE
				 ORDER BY OS_PEDIDOS  DESC;


				 SELECT * FROM CLIENTE WHERE EXISTS
				(SELECT * FROM PEDIDOS
				 WHERE CLIENTE.COD_CLIE = PEDIDOS.COD_CLIE
				 GROUP BY PEDIDOS.TOT_PEDIDO
				 HAVING MAX(PEDIDOS.TOT_PEDIDO) > 5)


				 SELECT * FROM CLIENTE;
				 SELECT * FROM PEDIDOS;

				 /* JOIN'S */
				SELECT  * FROM CLIENTE A INNER JOIN PEDIDOS PEDIDOS ON A.COD_CLIE = PEDIDOS.COD_CLIE; 

				/* LEFT JOIN */ 
				SELECT * FROM CLIENTE A LEFT JOIN  PEDIDOS C ON A.COD_CLIE = C.COD_CLIE;
				 
				SELECT * FROM CLIENTE A  FULL JOIN  PEDIDOS C ON  A.COD_CLIE  = C.COD_CLIE;


				 
				/* RIGHT JOIN */
				SELECT * FROM CLIENTE A RIGHT JOIN  PEDIDOS C ON A.COD_CLIE = C.COD_CLIE;

				SELECT * FROM PRODUTO;
				SELECT * FROM CLIENTE; 
				SELECT * FROM ITEM_PEDIDO;
				SELECT * FROM PEDIDOS;



				/* FUN��O DE GRUPO  */

				SELECT COUNT(*) "Total de Clientes"
				FROM CLIENTE;

				SELECT * FROM CLIENTE;


				SELECT MAX (TOT_PEDIDO) "Maior Pedido", MIN (TOT_PEDIDO) "Menor Pedido"
				FROM PEDIDOS

				SELECT * FROM PEDIDOS;

				SELECT SUM (TOT_PEDIDO) "Soma dos Pedidos"
				FROM PEDIDOS;



				SELECT MAX (NM_CLIE), MIN (NM_CLIE)
				FROM CLIENTE;



				/* FUN��O DE LINHA, VIEWS E UPDATE. */

				SELECT  NM_CLIE, LEN (NM_CLIE) AS 'Total de Caracteres'
				FROM CLIENTE
				GO

				SELECT  NM_CLIE, LOWER (NM_CLIE) AS 'Nome em minusculo'
				FROM CLIENTE
				GO



				SELECT TIPO_PROD, UPPER (TIPO_PROD) AS 'LETRAS MAIUSCULAS'
				FROM  PRODUTO
				GO


				SELECT NM_CLIE, LEFT (NM_CLIE,5) AS '5 PRIMEIRAS LETRAS'
				FROM  CLIENTE
				GO


				SELECT TIPO_PROD, RIGHT (TIPO_PROD,5) AS '5 PRIMEIRAS LETRAS'
				FROM  PRODUTO
				GO


				SELECT NM_CLIE, RIGHT(LTRIM (NM_CLIE), 12) AS 'RIGHT/LTRIM'
				FROM  CLIENTE
				GO


				/* DATA ATUAL */
				SELECT GETDATE()AS 'Data Atual'
				GO


				SELECT DATEPART(YEAR,DT_PEDIDO)	AS 'Ano da data de Pedido'
				FROM PEDIDOS
				GO

				SELECT DATEPART(MONTH,DT_PEDIDO)	AS 'M�s da data de Pedido'
				FROM PEDIDOS
				GO


				SELECT DATEPART(DAY,DT_PEDIDO)	AS 'Dia da data de Pedido', DT_PEDIDO
				FROM PEDIDOS
				GO

				SELECT * FROM PEDIDOS;


				/* datediff OS DIAS QUE PASSARAM DA DATA DE PEDIDO */
				SELECT DATEDIFF(DAY,DT_PEDIDO, GETDATE()) 'Dias Corridos', GETDATE() 'Data atual' ,    DT_PEDIDO 'Data do Pedido'
				FROM PEDIDOS
				GO



				/* Usuario logado no BD */
				SELECT SYSTEM_USER 
				DECLARE @SYS_USR CHAR(30) 
				SET @SYS_USR = SYSTEM_USER  
				SELECT 'O usu�rio logado no BD � : ' +   @SYS_USR ;


				/*Suser_name ([server_user_id]) */

				select suser_name ()
				select suser_sname(1)

				/*  SUBCONSULTA - Monstrar quem tem maior ou igual de total de pedidos*/

				SELECT NM_CLIE, TOT_PEDIDO
				FROM CLIENTE, PEDIDOS
				WHERE TOT_PEDIDO >= (SELECT TOT_PEDIDO
									FROM CLIENTE
									WHERE NM_CLIE = 'Luna Duvas Levalte')



				SELECT * FROM CLIENTE;
				SELECT * FROM PEDIDOS;

				/* View - Mostrar o cliente do cod_clie = 5  */

				CREATE VIEW OS_CLIENTE
				AS SELECT  NM_CLIE
				FROM CLIENTE
				WHERE COD_CLIE = 5;


				SELECT * FROM CLIENTE;

				SELECT *FROM OS_CLIENTE;


				SP_HELP CLIENTE

				SP_HELP OS_CLIENTE




