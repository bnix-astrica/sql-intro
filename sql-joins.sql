/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS ProductName, c.Name AS CategoryName
FROM products AS p
INNER JOIN categories AS c ON c.CategoryID = p.CategoryID
WHERE c.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products AS p
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold. use the sum() function and group by */
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(s.Quantity) AS TotalQuantity
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalQuantity DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS DepartmentName, c.Name AS CategoryName
FROM departments AS d
INNER JOIN categories AS c ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games'; -- Alternatively: WHERE c.Name IN ('Appliances', 'Games')

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS TotalSold, SUM(s.Quantity * s.PricePerUnit) AS TotalPriceSold
FROM products AS p
INNER JOIN sales AS s ON p.ProductID = s.ProductID
WHERE p.Name LIKE '%Hotel California%'
GROUP BY p.ProductID, p.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r ON p.ProductID = r.ProductID
WHERE p.Name LIKE '%Visio%'
ORDER BY r.Rating ASC
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS ProductName, SUM(s.Quantity) AS TotalQuantitySold
FROM employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, p.ProductID, p.Name
ORDER BY e.EmployeeID, TotalQuantitySold DESC;