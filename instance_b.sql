-- Instance B: Meeting the database
-- Funcionario
SELECT
	column_name,
	data_type,
	table_catalog,
	table_name
FROM
	information_schema.columns
	WHERE table_name = 'funcionario';
	
-- Categoria
SELECT
	column_name,
	data_type,
	table_catalog,
	table_name
FROM
	information_schema.columns
	WHERE table_name = 'categoria';

select * from funcionario;
insert into funcionario values (30,'Funcionario Teste1');

