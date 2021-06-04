-- Instance A: Meeting the database
SELECT
	column_name,
	data_type,
	table_catalog,
	table_name
FROM
	information_schema.columns
	WHERE table_name = 'venda';
	
select * from venda;

-- some tests below
-- -------------------------------------------------------------------------------
-- Right! Now, let's making tests
CREATE TABLE venda2 as 
	select * from venda;
	
select * from venda2;

-- this table it will serve for to prove the tests

-- after create view vw_IA_venda2 at Instance C, we added one row
insert into venda2 (id_venda, id_funcionario, id_categoria, data_venda, venda) 
			values (1018,8,3,'2021-06-01', 130);
			

