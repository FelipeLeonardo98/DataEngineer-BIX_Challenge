-- Insight for help others squads (BI and Data Science) 
SELECT
	column_name,
	data_type,
	table_catalog,
	table_name
FROM
	information_schema.columns
	WHERE table_name = 'vw_ic_client_data';

-- Insights: Sales
-- Amount by Year
SELECT  DATE_PART('YEAR', data_venda) as "Year", 
			SUM(venda) as "Amount by Year" 
		FROM vw_ic_client_data
			GROUP BY "Year"
			ORDER BY "Year" DESC;
			
-- What was the month with most sales?
SELECT 
	   DATE_PART('YEAR', data_venda) as "Year",
	   DATE_PART('MONTH', data_venda) as "Month", 
	   venda 
FROM vw_ic_client_data 
		WHERE venda = (SELECT MAX(venda) FROM vw_ic_client_data);

-- Amount by Month/Year
SELECT  DATE_PART('YEAR', data_venda) as "Year",
	   	DATE_PART('MONTH', data_venda) as "Month",
	   		SUM(venda) as "Amount by Month" 
		FROM vw_ic_client_data
			GROUP BY "Year", "Month"
			ORDER BY "Year", "Month";

-- Amount by Day
SELECT data_venda AS "DATE_SALE", 
			SUM(venda) as "Amount by Day" 
	   FROM vw_ic_client_data
			GROUP BY "DATE_SALE"
			ORDER BY "DATE_SALE" DESC;
		
-- Insights: Category
--  by category/Year
SELECT  nome_categoria,
		DATE_PART('YEAR', data_venda) as "Year",
	   		SUM(venda) as "Amount by Year" 
		FROM vw_ic_client_data
			GROUP BY nome_categoria, "Year"
			ORDER BY "Year";
			
--  by category/Year/month
SELECT  nome_categoria,
		DATE_PART('YEAR', data_venda) as "Year",
		DATE_PART('MONTH', data_venda) as "Month",
	   		SUM(venda) as "Amount by Month" 
		FROM vw_ic_client_data
			GROUP BY nome_categoria, "Year", "Month"
			ORDER BY "Year", "Month";
			
-- Insight: Employees
-- Employees/Year/month
SELECT  nome_funcionario,
		DATE_PART('YEAR', data_venda) as "Year",
		DATE_PART('MONTH', data_venda) as "Month",
	   		SUM(venda) as "Amount by Month" 
		FROM vw_ic_client_data
			GROUP BY nome_funcionario, "Year", "Month"
			ORDER BY "Year", "Month";
						
-- AVG by Year
SELECT
		DATE_PART('YEAR', data_venda) as "Year",
	   	AVG(venda) as "Average" 
FROM vw_ic_client_data
		GROUP BY "Year";