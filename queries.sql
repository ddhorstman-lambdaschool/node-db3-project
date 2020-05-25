-- Display the ProductName and CategoryName for all products in the databASe. Shows 77 records.
SELECT p.ProductName,
       c.CategoryName
FROM Product AS p
Join Category AS c ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id,
       s.CompanyName
FROM [Order] AS o
JOIN Shipper AS s ON o.ShipVia = s.id
WHERE OrderDate > '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT o.id,
       s.CompanyName
FROM [Order] AS o
JOIN Shipper AS s ON o.ShipVia = s.id
WHERE o.OrderDate < '2012-08-09';

-- Display the OrderID, Customer's Company Name and the employee's LAStName for every order. All columns should be labeled clearly. Displays 16,789 records.
Select o.id AS OrderId,
       c.CompanyName,
       e.LAStName AS EmployeeLAStName
FROM [Order] AS o
JOIN Customer AS c ON c.Id = o.CustomerId
Join Employee AS e ON o.EmployeeId = e.Id;

--Stretch: Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT c.CategoryName,
       COUNT(p.id) AS Count
FROM Category AS c
JOIN Product AS p ON (p.CategoryId= c.Id)
GROUP BY p.CategoryId;

-- Stretch: Display OrderID and a column called ItemCount that shows the total number of products placed ON the order. Shows 196 records.
SELECT o.id AS OrderID,
       COUNT(i.OrderId) AS ItemCount
FROM [Order] AS o
JOIN OrderDetail AS i ON (i.OrderId= o.Id)
GROUP BY i.OrderId;

