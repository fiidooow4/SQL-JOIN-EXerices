/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT P.NAME ,C NAME
FROM Proudcts AS P	
INNER JOIN categories AS C
ON C.categries = P.CategoryID
WHERE C.categroyID = 1;


/* joins: find all product names, product prices, and products ratings that have a rating of 5 */


 SELECT p.Name, p.Price, r.Rating
FROM products as p
INNER JOIN reviews as r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */



SELECT e.FirstName, e.LastName, SUM(s.Quantity) as "Total"
FROM sales as s
INNER JOIN employees as e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
limit 2;



/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.Name as "Department Name", c.Name as "Category Name"
FROM departments as d
INNER JOIN categories as c
ON d.DepartmentID = c.DepartmentID
where c.Name = "Appliances" OR c.Name = "Games";



/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.Name, SUM(s.Quantity) as "Total Sales", SUM(s.Quantity * s.PricePerUnit) as "Total Price"
FROM sales as s
INNER JOIN products as p
ON s.ProductID = p.ProductID
WHERE p.Name LIKE "%Hote1%"
GROUP BY p.ProductID;

 
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM reviews as r
INNER JOIN products as p
ON r.ProductID = p.ProductID
WHERE p.Name LIKE "%Visio%" AND r.Rating = 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name as "Product", s.Quantity as "Quantity Sold"
FROM sales as s
INNER JOIN employees as e
ON s.EmployeeID = e.EmployeeID
INNER JOIN products as p
on s.ProductID = p.ProductID;