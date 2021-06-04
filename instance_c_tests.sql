-- TESTS MADE IN INSTANCE C

-- making the firts tests
-- instance A: table venda2
select * from dblink('host=34.134.206.153 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'select id_venda, id_funcionario, id_categoria, data_venda, venda from venda2') 
					 	as Instance_A_VENDAS 
						(id_venda INT, id_funcionario INT, id_categoria INT, data_venda DATE, venda FLOAT);
					 
CREATE VIEW vw_IA_venda2 AS
  SELECT *
    FROM dblink('host=34.134.206.153 user=admin_bix password=C4sB;Sc!}c>vS)DD dbname=desafio',
					 'select id_venda, id_funcionario, id_categoria, data_venda, venda from venda2') 
					 	as Instance_A_VENDAS 
						(id_venda INT, id_funcionario INT, id_categoria INT, data_venda DATE, venda FLOAT);
-- test view
select * from vw_IA_venda2;
-- we've 1.017 rows.....let's add 1 row into Instance A: table venda2
select count(*) as amount from vw_IA_venda2; -- 1.1018 rows... the view it will updated with success !