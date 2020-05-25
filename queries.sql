-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName
FROM Product as p
Join Category as c
    on p.CategoryId = c.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, s.CompanyName
 FROM [Order] as o
 JOIN Shipper as s
     on o.ShipVia = s.id
 WHERE OrderDate > '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT o.id, s.CompanyName
 FROM [Order] as o
 JOIN Shipper as s
     on o.ShipVia = s.id
     WHERE o.OrderDate < '2012-08-09';
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
Select o.id as OrderId, c.CompanyName, e.LastName as EmployeeLastName
FROM [Order] as o
JOIN Customer as c
    on c.Id = o.CustomerId
Join Employee as e
    on o.EmployeeId = e.Id;
