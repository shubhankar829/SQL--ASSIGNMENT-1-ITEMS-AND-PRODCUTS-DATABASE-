create database brands
use brands

create table ITEMS_TABLE(
item_id int primary key,
item_description varchar(70),
vendor_nos int,
vendor_name varchar(70),
bottle_size int,
bottle_price decimal(10,2)
);

INSERT INTO ITEMS_TABLE 
(Item_Id, item_description, vendor_nos, vendor_name, bottle_size, bottle_price)
VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.5),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);

select * from ITEMS_TABLE

create database products

use products

create table product_table (
	Product_Id INT,
    Country VARCHAR(50),
    Product VARCHAR(50),
    Units_Sold DECIMAL(10, 2),
    Manufacturing_Price INT,
    Sale_Price INT,
    Gross_Sales DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    COGS DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(20),
    Year INT
);



INSERT INTO product_table 
(Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, Month_Number, Month_Name, Year)
VALUES
(1, 'Canada', 'Carretera', 1618.5,3, 20, 32370, 32370, 16185, 16185, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321,3, 20, 26420, 26420, 13210, 13210, '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3,15, 32670, 32670, 21780, 10890, '2016-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera',  888, 3, 15, 13320, 13320, 8880, 4440, '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera',  2470, 3, 15, 37050, 37050, 24700, 12350, '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera',  1513,3, 350, 529550, 529550, 393380, 136170, '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana',  921,5, 15, 13815, 13815, 9210, 4605, '2020-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana',  2518,5,  12, 30216, 30216, 7554, 22662, '2021-06-01', 6, 'June', 2021);

select * from product_table

delete from product_table where Units_Sold IN (1618.5 , 888, 2470);

-- Select all records from the bottle_info table.
select * from ITEMS_TABLE

-- Select the item_description and bottle_price for all items in the bottle_info table
select item_description,bottle_price from ITEMS_TABLE

-- Find the item_description and bottle_price of items where bottle_price is greater than 20.
select item_description,bottle_price from ITEMS_TABLE where bottle_price >20

-- Select Unique Country from the product_sales table
use products
select distinct Country from product_table

-- Count the number of Countries in the product_sales table
select count(Country) as number_of_Countries from product_table

-- How Many Countries are there which contain the sales price between 10 to 20 
select count(Country) as number_of_Countries from product_table where Sale_Price between 10 and 20

/*
Intermediate Questions
------------------------------------------------------------------------------------------------------------------------------------------
PRODUCTS_SALES_TABLE:
*/
-- Find the Total Sale Price and Gross Sales
select sum(sale_price) as Total_Sales_Price, sum(gross_sales) as Total_Gross_Sales
from product_table

-- In which year we have got the highest sales
select year from product_table where sales = (select max(sales) from product_table)

-- Which Product having the sales of $ 37,050.00
SELECT * from product_table where sales = '37050'

-- Which Countries lies between profit of $ 4,605 to $ 22 , 662.00
select distinct Country from product_table where profit between '4605' and '22662'

-- Which Product Id having the sales of $ 24 , 700.00
select product_id from product_table where Sale_Price = '24700'

-- Find the total Units Sold for each Country.
select country, sum(units_sold) as TotalUnitSold from  product_table
group by Country

-- . Find the average sales for each country
select country, avg(Sales) as TotalUnitSold from  product_table
group by Country

-- Retrieve all products sold in 2014
select *  from product_table where year = '2024'

-- . Find the maximum Profit in the product_sales table.
select max(profit) as Max_Profit from product_table

-- Retrieve the records from product_sales where Profit is
-- greater than the average Profit of all records.

select * from product_table 
where profit > (select avg(Profit) from product_table) 

-- Find the item_description having the bottle size of 750
select item_description from ITEMS_TABLE where bottle_size = '750'

-- Find the vendor Name having the vendor_nos 305 , 380 ,
-- 391select * from ITEMS_TABLE where vendor_nos IN ('305','380','391')-- What is total Bottle_price
select sum(bottle_price) as TotalBottlePrize from ITEMS_TABLE

-- Make Primary Key to Item_id
ALTER TABLE ITEMS_TABLE
ADD CONSTRAINT item_id PRIMARY KEY (Item_Id);

-- Which item id having the bottle_price of $ 5.06select item_id from ITEMS_TABLE where bottle_price = '5.06'
select * from product_table

/*
Advance Questions:-
-------------------------
*/

-- Apply INNER , FULL OUTER , LEFT JOIN types on both the table
select * from product_table p1 left join product_table p2 on p1.Product_Id = p2.Product_Id
select * from product_table p1 inner join product_table p2 on p1.Product_Id = p2.Product_Id
select * from product_table p1 full outer join product_table p2 on p1.Product_Id = p2.Product_Id

-- Apply INNER , FULL OUTER , LEFT JOIN types on both the table
select * from ITEMS_TABLE i1 left join ITEMS_TABLE i2 on i1.item_id = i2.item_id
select * from ITEMS_TABLE i1 inner join ITEMS_TABLE i2 on i1.item_id = i2.item_id
select * from ITEMS_TABLE i1 full outer join ITEMS_TABLE i2 on i1.item_id = i2.item_id

-- Find the item_description and Product having the gross sales of
--13,320.00select a.item_description,b.Product from brands.dbo.ITEMS_TABLE a 
left join products.dbo.product_table b
on a.item_id = b.Product_Id
where Gross_Sales = '13320';

-- . Split the Item_description Column into Columns Item_desc1 and
-- Item_desc2
select 
item_description,
SUBSTRING(item_description,1, CHARINDEX(' ', item_description)) as  first_name,
SUBSTRING(item_description, CHARINDEX(' ', item_description) +1 , LEN(item_description)) AS last_name
from brands.dbo.ITEMS_TABLE;

-- Find the top 3 most expensive items in the bottle_info table.With CTE as (
select 
	item_id, 
	item_description,
	bottle_price,
	rank() over(order by bottle_price desc)  as rnk
from 
	brands.dbo.ITEMS_TABLE
)
select top 3 * from cte
-- select * from cte where rnk IN ('1','2','3')

-- Find the total Gross Sales and Profit for each Product in each
-- Country.
select Country, Product, sum(gross_sales) as TotalGrossSales, 
sum(profit) as TotalProfit
from products.dbo.product_table
group by Country, Product
order by Country asc

-- . Find the vendor_name and item_description of items with a
-- bottle_size of 750 and bottle_price less than 10

select vendor_name, item_description from brands.dbo.ITEMS_TABLE
where bottle_size = '750' and bottle_price < 10

--. Find the Product with the highest Profit in 2019.

select PRODUCT, year, profit, rank() over(partition by year order by profit desc)  as rnk 
from products.dbo.product_table
where year = '2019'

--Retrieve the Product_Id and Country of all records where the
-- Profit is at least twice the COGS.
select product_id, country from products.dbo.product_table
where profit >= (2 * COGS)

-- Find the Country that had the highest total Gross Sales in 2018select year,Country, sum(gross_sales) over (partition by year,Country order by year) as TotalGrossSales
from products.dbo.product_table
where year = 2018

-- Calculate the total Sales for each Month Name across all
-- years.

select year,Month_name, sum(sales) as TotalSales
from products.dbo.product_table
group by year,Month_name

--List the item_description and vendor_name for items
--whose vendor_nos exists more than once in the bottle_info
-- table.select item_description,vendor_name from brands.dbo.ITEMS_TABLE where vendor_nos IN (select vendor_nos from brands.dbo.ITEMS_TABLE group by vendor_noshaving count(*) > 1)-- Find the average Manufacturing Price for Product in each
-- Country and only include those Country and Product
-- combinations where the average is above 3
SELECT 
    Country,
    Product,
    AVG(Manufacturing_Price) AS Avg_Manufacturing_Price
FROM 
    products.dbo.product_table
GROUP BY 
    Country, Product
HAVING 
    AVG(Manufacturing_Price) > 3;

-- Super-Advance Questions:-

-- Find the item_description and bottle_price of items that have
-- the same vendor_name as items with Item_Id 1.

select item_description, bottle_price
from brands.dbo.ITEMS_TABLE 
where vendor_name = (select vendor_name from brands.dbo.ITEMS_TABLE where item_id = 1)

/*2. Create a stored procedure to retrieve all records from the
bottle_info table where bottle_price is greater than a given
value*/

CREATE PROCEDURE GetBottlesAbovePrice
@price_limit DECIMAL(10, 2)
as
BEGIN
    SELECT * 
    FROM brands.dbo.ITEMS_TABLE
    WHERE bottle_price > @price_limit;
END;

EXEC GetBottlesAbovePrice @price_limit = 15.00;


/*3. Create a stored procedure to insert a new record into the
product_sales table.*/

CREATE PROCEDURE InsertProductSalesRecord(
    @p_Product_Id INT,
    @p_Country VARCHAR(50),
    @p_Product VARCHAR(50),
    @p_Units_Sold DECIMAL(10, 2),
    @p_Manufacturing_Price INT,
    @p_Sale_Price INT,
    @p_Gross_Sales DECIMAL(10, 2),
    @p_Sales DECIMAL(10, 2),
    @p_COGS DECIMAL(10, 2),
    @p_Profit DECIMAL(10, 2),
    @p_Date DATE,
    @p_Month_Number INT,
    @p_Month_Name VARCHAR(20),
    @p_Year INT
)
as
BEGIN
    INSERT INTO products.dbo.product_table (
        Product_Id, Country, Product, Units_Sold, Manufacturing_Price, 
        Sale_Price, Gross_Sales, Sales, COGS, Profit, Date, 
        Month_Number, Month_Name, Year
    ) VALUES (
        @p_Product_Id, @p_Country, @p_Product, @p_Units_Sold, 
        @p_Manufacturing_Price, @p_Sale_Price, @p_Gross_Sales, 
        @p_Sales, @p_COGS, @p_Profit, @p_Date, 
        @p_Month_Number, @p_Month_Name, @p_Year
    );
END;

EXEC InsertProductSalesRecord 
    @p_Product_Id = 1,
    @p_Country = 'Canada',
    @p_Product = 'Carretera',
    @p_Units_Sold = 1618.5,
    @p_Manufacturing_Price = 3,
    @p_Sale_Price = 20,
    @p_Gross_Sales = 32370,
    @p_Sales = 32370,
    @p_COGS = 16185,
    @p_Profit = 16185,
    @p_Date = '2014-01-01',
    @p_Month_Number = 1,
    @p_Month_Name = 'January',
    @p_Year = 2014;

SELECT * 
FROM products.dbo.product_table
ORDER BY Product_Id asc;

/*4. Create a trigger to automatically update the Gross_Sales field in
the product_sales table whenever Units_Sold or Sale_Price is
updated.*/

-- need help in trigger

-- Write a query to find all item_description in the bottle_info
-- table that contain the word "Whisky" regardless of case.

select item_description from brands.dbo.ITEMS_TABLE 
where lower(item_description) like '%whisky%'

-- Write a query to find the Country and Product where the Profit
-- is greater than the average Profit of all products

select 
	Country,
	Product
from 
	products.dbo.product_table
where 
	profit > (select avg(Profit) from products.dbo.product_table)

/*7. Write a query to join the bottle_info and product_sales tables on
a common field (e.g., vendor_nos) and select relevant fields
from both tables.*/

No matching column in the table, both the table are separate.

/*Write a query to combine item_description and vendor_name
into a single string for each record in the bottle_info table,
separated by a hyphen.*/

select
	CONCAT(item_description,  ' - ', vendor_name) as bottle_info
from 
	brands.dbo.ITEMS_TABLE
/*
Write a query to display the bottle_price rounded to one
decimal place for each record in the bottle_info table
*/

select round(bottle_price,1) from brands.dbo.ITEMS_TABLE

/*
Write a query to calculate the number of days between the
current date and the Date field for each record in the
product_sales table.*/

SELECT 
    Product_Id,
    DATEDIFF(Day, Date,getdate()) AS Days_Since_Sale
FROM 
products.dbo.product_table

select * from products.dbo.product_table;
select * from brands.dbo.ITEMS_TABLE ;