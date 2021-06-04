-- Start Pipeline (Instance C)
-- "dblink" it will help us to connect to other instances (servers)
CREATE EXTENSION dblink;

-- Mapping Instances and making the firts tests

-- Instance A
select * from dblink('host=34.134.206.153 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'select data_venda, venda from venda') as Instance_A_VENDAS (data_venda DATE, venda FLOAT);
					 

-- Instance B
-- Funcionario
select * from dblink('host=34.134.228.49 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'select nome_funcionario from funcionario') f (funcionario varchar)

 -- Categoria						
select * from dblink('host=34.134.228.49 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'select nome_categoria from categoria') c (categoria varchar);
																	


-- CREATE VIEWS querying instances A(table "VENDA") and B(tables: "FUNCIONARIO" and "CATEGORIA")
-- Prefix: vw = view; I + letter = Instance A/B/C

-- instance A: table "VENDA"
CREATE VIEW vw_IA_venda AS
  SELECT *
    FROM dblink('host=34.134.206.153 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'SELECT id_venda, id_funcionario, id_categoria, data_venda, venda FROM venda') 
					 	as Instance_A_VENDAS 
						(id_venda INT, id_funcionario INT, id_categoria INT, data_venda DATE, venda FLOAT);
						
						
-- instance B: table "FUNCIONARIO"
CREATE VIEW vw_IB_funcionario AS
	SELECT *
    FROM dblink('host=34.134.228.49 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'SELECT id, nome_funcionario FROM funcionario') 
					 	as Instance_B_FUNCIONARIOS 
						(id INT, nome_funcionario TEXT);
						
-- instance B: table "CATEGORIA"
 CREATE VIEW vw_IB_categoria AS
	SELECT *
    FROM dblink('host=34.134.228.49 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'SELECT id, nome_categoria FROM categoria') 
					 	as Instance_B_CATEGORIA 
						(id INT, nome_categoria TEXT);
						
-- test views
SELECT * FROM vw_ia_venda;
SELECT * FROM vw_ib_funcionario;
SELECT * FROM vw_ib_categoria;

-- we will work using this view: vw_ic_client_data (complete source of data from our client)
CREATE VIEW vw_ic_client_data AS
	SELECT id_venda, f.nome_funcionario, c.nome_categoria, data_venda, venda 
		FROM vw_ia_venda
		INNER JOIN vw_ib_funcionario  f
			ON vw_ia_venda.id_funcionario = f.id
		INNER JOIN vw_ib_categoria  c
			ON vw_ia_venda.id_categoria = c.id
			ORDER BY vw_ia_venda;