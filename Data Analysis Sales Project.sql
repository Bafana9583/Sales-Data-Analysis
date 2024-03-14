/*

Data Analysis Using SQL Quiries

*/
-------------------------------------------------------------------------

--Inspecting Imported Data

Select *
From dbo.[Sales Data]

--------------------------------------------------------------------------

--Checking Unique Values using DISTINCT

Select DISTINCT Order_ID From dbo.[Sales Data]
Select DISTINCT Product From dbo.[Sales Data] --Plot on Tableau
Select DISTINCT Price_Each From dbo.[Sales Data] --Plot on Tableau
Select DISTINCT City From dbo.[Sales Data]  --Plot on Tableau
Select DISTINCT Purchase_Address From dbo.[Sales Data] --Plot on Tableau
Select DISTINCT Quantity_Ordered From dbo.[Sales Data] --Plot on Tableau

----------------------------------------------------------------------------

--Analysis of Data

--1). Checking Which Product sold the Most

Select Product, SUM(Sales) Revenue
From PortfolioProject.dbo.[Sales Data]
GROUP BY Product
ORDER BY 2 DESC

--2). Checking which Order Date made the highest Revenue from sale of products in 2019

Select Order_Date, SUM(Sales) Revenue
From PortfolioProject.dbo.[Sales Data]
GROUP BY Order_Date
ORDER BY 2 DESC

--3). Checking the price for each product that had the highest Revenue in the year 2019

Select Product, Price_Each, SUM(Sales) Revenue
From PortfolioProject.dbo.[Sales Data]
GROUP BY Product, Price_Each
ORDER BY 2 DESC

---------------------------------------------------------------------------------------

--Which was the best Month for sales in the year 2019? How Much Was It?

Select Month, SUM(Sales) Revenue, COUNT (Quantity_Ordered) Frequency
From PortfolioProject.dbo.[Sales Data]
GROUP BY Month
ORDER BY 2 DESC

-->> December is the best month for sales in 2019.

--Now Lets Check which Product sold the most in the month of December 2019.

Select Month, Product, SUM(Sales) Revenue, COUNT (Quantity_Ordered) Units
From PortfolioProject.dbo.[Sales Data]
WHERE Month = 12
GROUP BY Month, Product
ORDER BY 3 DESC

--------------------------------------------------------------------------------------------

--Using RFM, Find out which Address hasthe sa highest Monetary value of sales in 2019.

Select
	Purchase_Address,
	SUM(Sales) MonetaryValue,
	AVG(Sales) AvgMonetaryValue,
	COUNT(Quantity_Ordered) Frequency,
	MAX(Order_Date) last_order_date 
From dbo.[Sales Data]
GROUP BY Purchase_Address
ORDER BY 2 DESC

-->> 668 Park ST, San Francisco, CA 94016 is the Purchase Address with the highest MonetaryValue of sales in the year 2019.

-----------------------------------------------------------------------------------------------------------------------------

--Total Revenue 

Select 
	SUM(Sales) as Total_Revenue 
From dbo.[Sales Data] ---- 34492035.7974904

--Total Distinct Purchase-Addresses

Select
	COUNT(DISTINCT Purchase_Address) as TotalDistinctPurchaseAddress
From dbo.[Sales Data] ----140 787 different addresses

--Total Distinct Cities

Select
	COUNT(DISTINCT City) as TotalDistinctCity
From dbo.[Sales Data] ---- 9 cities

--Total Products
Select
	COUNT(Product) as TotalProduct
From dbo.[Sales Data] ----185 950 products

--Total Sales By City

Select
	City, SUM(Sales) AS TotalRevenue
From dbo.[Sales Data]
GROUP BY City

-------------------------------------------------------------------------------------------------------------------------------------


--Top 5 Purchase Addresses across all the different Cities by Sales

Select
	Top 5 Purchase_Address, Sales
From dbo.[Sales Data]
ORDER BY Sales DESC ---- 668 Park St, San Francisco, CA 94016

--Top 5 Cities By Sales

Select
	Top 5 City, Sales
From dbo.[Sales Data]
ORDER BY Sales DESC  --- San Francisco

--Product by Total Sales

Select
	Product, SUM(Sales) as TotalRevenue
From dbo.[Sales Data]
Group BY Product


--Year By Sale

Select Year(Order_Date) as Years, SUM(Sales) as TotalRevenue
From dbo.[Sales Data]
Group BY Year(Order_Date)

--Quantity by Sales (Quarters

Select
	DATENAME(Quarter,Order_Date) as Quarters ,SUM(Sales) as TotalRevenue
From dbo.[Sales Data]
GROUP BY DATENAME(Quarter,Order_Date)

--Totals Sales By Month

Select 
	DATENAME(MONTH,Order_Date) as Months ,SUM(Sales) as TotalRevenue
From dbo.[Sales Data]
GROUP BY DATENAME(MONTH,Order_Date) 
ORDER BY 2 DESC

----------------------------------------------------END OF PROJECT------------------------------------------------