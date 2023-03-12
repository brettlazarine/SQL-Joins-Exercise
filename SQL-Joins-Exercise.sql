/* DONE -- joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.name AS 'Product Name', c.name AS 'Category Name'
FROM products AS p
INNER JOIN categories AS c ON p.CategoryID = c.CategoryID
WHERE p.CategoryID = 1;

/* DONE -- joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.name AS 'Product Name', p.price as 'Product Price', r.rating as 'Product Rating' 
FROM products AS p
INNER JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE r.rating = 5;
 
/* DONE -- joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS 'Quantity Sold'
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC
LIMIT 1;

/* DONE -- joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS 'Department Name', c.Name AS 'CategoryName'
FROM departments AS d
INNER JOIN categories AS c ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* DONE -- joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name AS 'ProductName', SUM(s.Quantity) AS 'TotalSold', SUM(s.PricePerUnit * s.Quantity) AS 'TotalPriceSold'
 FROM products AS p
 INNER JOIN sales AS s ON p.ProductID = s.ProductID
 WHERE p.Name = 'Eagles: Hotel California'
 GROUP BY p.Name;

/* DONE -- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS 'ProductName', r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE p.Name LIKE '%visio tv%' AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* DONE -- Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS 'ProductName', SUM(s.Quantity) AS 'QuantitySold'
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.EmployeeID;