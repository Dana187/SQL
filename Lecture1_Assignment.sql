# SQL

# Lecture1_Assignment

# 1.1 Select all the products in product category 

SELECT *
From Products
Where CategoryID = 1

# 1.2 How many in total?

SELECT COUNT(ProductID)
From Products
Where CategoryID = 1


# 2.1 Select all the customers from France. 

SELECT *
From Customers
Where Country = 'France'

# 2.2 Out of those, how many are at Paris?

SELECT Count(CustomerID)
From Customers
Where Country = 'France' and City = 'Paris'


# 3. How many orders are placed during 1996-07-01 and 1996-07-31?

SELECT Count(OrderID)
From Orders
Where orderdate between 1/7/1996 and 31/7/1996


# 4. Which employee graduated from University of Washington?

SELECT EmployeeID, LastName, FirstName
From Employees
Where Notes Like '%University of Washington%'


# 5.1 How many orders does each product ID have? 

SELECT ProductID, Count(OrderID) AS Num_of_Orders
From OrderDetails
Group by ProductID

# 5.2 What are the total quantity for each product? 

SELECT ProductID, SUM(Quantity) AS Total_QTY
FROM OrderDetails
Group by ProductID

# 5.3 What is the average quantity per order per product?

SELECT OrderID, ProductID, Avg(Quantity) as AVG_QTY
FROM OrderDetails
Group by OrderID, ProductID


# 6.1 How many different products are in each order? 

SELECT OrderID, Count(ProductID) AS Num_of_Product_Categories
FROM OrderDetails
Group by OrderID


## Better:
SELECT OrderID, Count(Distinct ProductID) AS Num_of_Product_Categories
FROM OrderDetails
Group by OrderID
Order by 2 Desc, 1


# 6.2 Which order has the most number of unique products? 不确定

SELECT Distinct OrderID, Count(ProductID) as Product_Count
FROM OrderDetails
GROUP BY OrderID
Order by Count(ProductID) desc


# Correct
SELECT OrderID, COUNT(ProductID) AS Num_Product 
FROM [OrderDetails]
GROUP BY OrderID
HAVING Num_Product = 5
ORDER BY 1;

# 7.1 Which products are sold in jars? 

SELECT * 
FROM Products
Where Unit Like '%jars%'

# 多一个order
SELECT * 
FROM Products
Where Unit Like '%jars%'
Order by 6 desc

#7.2 What is the most expensive product that's sold in jars?

SELECT * 
FROM Products
Where Unit Like '%jars%'
Order by price desc

#以上就是一个表，见以下操作,叫 Sub-Query

Select*
from
(
	SELECT * 
FROM Products
Where Unit Like '%jars%'
Order by price desc
)
where price = 43.9



# 8. What are the product names are included in order ID 10250? 

SELECT Products.ProductName
from Products
Right JOIN OrderDetails 
on Products.ProductID = OrderDetails.ProductID
Where OrderDetails.OrderID = 10250

#--- solution 2 table join 方法
SELECT [Products].ProductName, [OrderDetails].OrderID
FROM [Products] 
join [OrderDetails]
on [Products].ProductID = [OrderDetails].ProductID
where OrderID = 10250

# Sub-Query方法

SELECT * 
FROM [Products]
where ProductID in (
 SELECT ProductID
 FROM [OrderDetails]
 where OrderID = 10250
)

#为什么下面full join无法运行？

SELECT Products.ProductName
FROM Products
FULL JOIN OrderDetails 
on Products.ProductID = OrderDetails.ProductID
Where OrderDetails.OrderID = 10250


# 9. What products are contained in category 'Dairy Products'? 

SELECT Products.ProductName
FROM Products
Right JOIN Categories 
on Products.CategoryID = Categories.CategoryID
Where Categories.CategoryName = 'Dairy Products'

#为什么下面full join无法运行？

SELECT Products.ProductName
FROM Products
FULL JOIN Categories 
on Products.CategoryID = Categories.CategoryID
Where Categories.CategoryName = 'Dairy Products'


# Join practice

# 1. How many orders are made by Germany customers in total? 25

SELECT count(Orders.OrderID) as Num_of_Germany_Customers
FROM Customers
Right JOIN Orders
on Orders.CustomerID = Customers.CustomerID
Where Customers.Country = 'Germany'

#为什么用orders join customers表结果是27？有什么不同？应该怎么选？


# 2. How many orders are made by Germany customers that's shipped by shipper 2 in total?



# 3. Are there any prepared meats products are supplied by Tokyo Traders?



# 6.	Return the top 5 countries which have the most customers? 
# (hint: use distinct to get unique customers)

SELECT Country, count(CustomerID) as 'Custs'
FROM Customers
GROUP BY Country
Having count (CustomerID) >= 7
Order by 2 desc

# 8.	Which employees studied English in their education background? 

SELECT * 
FROM Employees
where Notes like '%English%'

# 9.	Which employees are born after 1960? (hint: use ‘1960-01-01’ to compare with brith date)


# 10.	Return the top 10 products have been sold the most

SELECT ProductID, Sum(Quantity) as 'sum_qty'
FROM OrderDetails
Group by ProductID
Order by 2 desc

# 11.	What are the 各自的 average prices for ‘bottles’ and ‘jars’ products? (hard)

SELECT SUBSTR(Unit, -4, 4) as 'units_last4',  AVG(price) as 'avg_price'
FROM [Products]
group by SUBSTR(Unit, -4, 4)
having SUBSTR(Unit, -4, 4) in ('tles', 'jars');






















