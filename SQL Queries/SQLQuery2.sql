SELECT * FROM Blinkit_Data;

SELECT COUNT(*) AS COUNT_OF_ITEMS FROM Blinkit_Data;

UPDATE Blinkit_Data
SET Item_Fat_Content =
CASE
   WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
   WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE
   Item_Fat_Content
END;

SELECT DISTINCT(Item_Fat_Content)
FROM Blinkit_Data;

SELECT CAST(SUM(Total_Sales) / 1000000 AS DECIMAL(10, 2)) AS TOTAL_SALES_IN_MILLIONS
FROM Blinkit_Data;

SELECT CAST(AVG(Total_Sales) AS DECIMAL(10, 0)) AS AVG_SALES
FROM Blinkit_Data;

SELECT CAST(SUM(Total_Sales) / 1000000 AS DECIMAL(10, 2)) AS TOTAL_SALES_IN_MILLIONS
FROM Blinkit_Data
WHERE Item_Fat_Content = 'Low Fat';

SELECT CAST(SUM(Total_Sales) / 1000000 AS DECIMAL(10, 2)) AS TOTAL_SALES_IN_MILLIONS
FROM Blinkit_Data
WHERE Outlet_Establishment_Year = 2022;

SELECT CAST(AVG(Total_Sales) AS DECIMAL(10, 2)) AS AVG_SALES_IN_2022
FROM Blinkit_Data
WHERE Outlet_Establishment_Year = 2022;

SELECT COUNT(*) No_Of_Items
FROM Blinkit_Data
WHERE Outlet_Establishment_Year = 2022;

SELECT CAST(AVG(Rating) AS DECIMAL (10, 2)) AS AVG_RATINGS
FROM Blinkit_Data;

SELECT Item_Fat_Content,
       CAST(SUM(Total_Sales) / 1000 AS DECIMAL (10, 2)) AS Total_Sales_In_Thousands,
	   CAST(AVG(Total_Sales) AS DECIMAL (10, 2)) AS Avg_Sales,
	   CAST(COUNT(*) AS DECIMAL (10, 2)) AS Count_Of_Items,
	   CAST(AVG(Rating) AS DECIMAL (10, 2)) AS Avg_Ratings
FROM Blinkit_Data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_In_Thousands DESC;

SELECT TOP 5 Item_Type,
       CAST(SUM(Total_Sales) AS DECIMAL (10, 2)) AS Total_Sales,
	   CAST(AVG(Total_Sales) AS DECIMAL (10, 2)) AS Avg_Sales,
	   CAST(COUNT(*) AS DECIMAL (10, 2)) AS Count_Of_Items,
	   CAST(AVG(Rating) AS DECIMAL (10, 2)) AS Avg_Ratings
FROM Blinkit_Data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

SELECT Outlet_Location_Type, Item_Fat_Content,
     CAST(SUM(Total_Sales) AS DECIMAL (10, 2)) AS Total_Sales
FROM Blinkit_Data
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY Total_Sales ASC;

SELECT Outlet_Location_Type,
       ISNULL([Low Fat], 0) AS Low_Fat,
	   ISNULL([Regular], 0) AS Regular
FROM
(   
  SELECT Outlet_Location_Type, Item_Fat_Content,
	CAST(SUM(Total_Sales) AS DECIMAL(10, 2)) AS Total_Sales
  FROM Blinkit_Data
  GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SOURCE_TABLE
PIVOT
(   SUM(Total_Sales)
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS Pivot_Table
ORDER BY Outlet_Location_Type;

SELECT Outlet_Establishment_Year,
	CAST(SUM(Total_Sales) AS DECIMAL(10, 2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS DECIMAL (10, 2)) AS Avg_Sales,
	CAST(COUNT(*) AS DECIMAL (10, 2)) AS Count_Of_Items,
	CAST(AVG(Rating) AS DECIMAL (10, 2)) AS Avg_Ratings
FROM Blinkit_Data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

SELECT Outlet_Establishment_Year,
	CAST(SUM(Total_Sales) AS DECIMAL(10, 2)) AS Total_Sales,
	CAST(AVG(Total_Sales) AS DECIMAL (10, 2)) AS Avg_Sales,
	CAST(COUNT(*) AS DECIMAL (10, 2)) AS Count_Of_Items,
	CAST(AVG(Rating) AS DECIMAL (10, 2)) AS Avg_Ratings
FROM Blinkit_Data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC;

SELECT Outlet_Size,
       CAST(SUM(Total_Sales) AS DECIMAL (10, 2)) AS Total_Sales,
	   CAST(SUM(Total_Sales) * 100 / SUM(SUM(Total_Sales)) OVER() AS DECIMAL(10, 2)) AS Sales_Percentage
FROM Blinkit_Data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;


SELECT Outlet_Location_Type,
	CAST(SUM(Total_Sales) AS DECIMAL(10, 2)) AS Total_Sales,
	CAST(SUM(Total_Sales) * 100 / SUM(SUM(Total_Sales)) OVER() AS DECIMAL(10, 2)) AS Sales_Percentage,
	CAST(AVG(Total_Sales) AS DECIMAL (10, 2)) AS Avg_Sales,
	CAST(COUNT(*) AS DECIMAL (10, 2)) AS No_Of_Items,
	CAST(AVG(Rating) AS DECIMAL (10, 2)) AS Avg_Rating
FROM Blinkit_Data
WHERE Outlet_Establishment_Year = 2022
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;


SELECT Outlet_Type,
       CAST(SUM(Total_Sales) AS DECIMAL (10, 2)) AS Total_Sales,
	   CAST(SUM(Total_Sales) * 100 / SUM(SUM(Total_Sales)) OVER() AS DECIMAL(10, 2)) AS Sales_Percentage,
	   CAST(AVG(Total_Sales) AS DECIMAL (10, 2)) AS Avg_Sales,
	   CAST(COUNT(*) AS DECIMAL (10, 2)) AS No_Of_Items,
	   CAST(AVG(Rating) AS DECIMAL (10, 2)) AS Avg_Rating
FROM Blinkit_Data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;
























