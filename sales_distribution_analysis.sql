-- inspect data
SELECT * FROM sales.sales_data_sample;

-- unique value
select distinct STATUS from sales.sales_data_sample;-- 6 values to plot
select distinct YEAR_ID from sales.sales_data_sample; -- 3 unique years
select distinct COUNTRY from sales.sales_data_sample; -- 7 type of productline to plot
select distinct DEALSIZE from sales.sales_data_sample; -- 3 size 
select distinct TERRITORY from sales.sales_data_sample; -- 4 territory

-- analysis
-- finding best revenue productline
select PRODUCTLINE, sum(SALES) as Revenue from sales.sales_data_sample
group by PRODUCTLINE order by 2 desc;
-- classic car has more revenue
-- which year has high revenue
select YEAR_ID, sum(SALES) as Revenue from sales.sales_data_sample
group by YEAR_ID order by 2 desc;

-- finding why revenue is low 
-- is that any problem in data that given??
-- finding nmonths for given years
select distinct MONTH_ID from sales.sales_data_sample where YEAR_ID=2005; -- total 5 months
select distinct MONTH_ID from sales.sales_data_sample where YEAR_ID=2004; -- total 12 months
select distinct MONTH_ID from sales.sales_data_sample where YEAR_ID=2003; -- total 12 months
-- as conclude due to month revenue of 2005 is low

-- which Deal size has high revenue
select DEALSIZE, sum(SALES) as Revenue from sales.sales_data_sample
group by DEALSIZE order by 2 desc;
-- Medium DealSize Genrate more Revenue

-- What Was the best month for sales in specific year and How much they earn during that month??
select MONTH_ID, sum(SALES) as Revenue, count(ORDERNUMBER) as totalorder from sales.sales_data_sample
where YEAR_ID = 2003 group by MONTH_ID order by 2 desc;
select MONTH_ID, sum(SALES) as Revenue, count(ORDERNUMBER) as totalorder from sales.sales_data_sample
where YEAR_ID = 2004 group by MONTH_ID order by 2 desc;
-- Mostly in november sale is high .

-- customer with highest number of revenue
select CUSTOMERNAME,sum(SALES) as Revenue from sales.sales_data_sample group by SALES order by 2 desc;
--  'La Corne D\'abondance, Co.' is the person with highest sale


-- Highest revenue by status
select STATUS, sum(SALES) as Revenue from sales.sales_data_sample
group by STATUS order by 2 desc;
-- 9291501.08 revenue come from shipped status

-- highest revenue genrate country 
SELECT COUNTRY,sum(SALES) as Revenue from sales.sales_data_sample group by COUNTRY order by SALES desc;
-- Singapore is the highest