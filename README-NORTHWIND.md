I have used PostgreSQL as main Database Management Systems (DBMS) and therefore you may encounter some queries that work in PostgreSQL may not work in
other DBMS such as SQL Server or MySQL as some implementations slight vary in syntax. For such cases, for example, in date and time operations 
I included standart SQL queries as well.

I populated mockdata using www.mockaroo.com to effectively practise the queries and get some output while working locally. Note that it is not the same large dataset used on the web site, so I suggest you use the web site itself as long as you have internet connection, which is also good for tracking your progress. You may use the northwind.sql database file given in the repository for convenience and a rapid start in creating schemas and inserting datasets.

The northwind test contains 13 questions and consists of 3 category:

- Easy
- Medium
- Hard

You can use the following Entity Relationship Diagram (ERD) to figure out what data to store, the entities, their attributes and also how entities 
relate to other entities.

![image](https://github.com/gulbalasalamov/sql-practise.com/assets/19313466/c448fe34-44c4-4c12-a6aa-fcbce72aea0d)

## Answers

> Want to help this repository? Feel free to contribute by submitting a custom solution to be added to the questions.

---

### Section1: Easy

---

Questions 1- 9

1. Show the category_name and description from the categories table sorted by category_name.

```sql
SELECT category_name, description
FROM categories
ORDER BY category_name;
```

2. Show all the contact_name, address, city of all customers which are not from 'Germany','Mexico','Spain'

 ```sql
SELECT contact_name, address, city
FROM customers
WHERE country NOT IN ('Germany', 'Mexico', 'Spain');
```

3. Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26

```sql
SELECT order_date, shipped_date, customer_id, freight
FROM orders
WHERE order_date = '2018-02-26';
```

4. Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date

```sql
SELECT employee_id, order_id, customer_id, required_date, shipped_date
FROM orders
WHERE shipped_date > required_date;
```

5. Show all the even numbered Order_id from the orders table

```sql
SELECT order_id
FROM orders
WHERE MOD(order_id,2) = 0;

-- alternative

SELECT order_id
FROM orders
WHERE order_id %2 = 0;
```

6. Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name

```sql
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE '%L%'
ORDER BY contact_name;
```

7. Show the company_name, contact_name, fax number of all customers that has a fax number. (not null)

```sql
SELECT company_name, contact_name, fax
FROM customers
WHERE fax IS NOT NULL;
```

8. Show the first_name, last_name. hire_date of the most recently hired employee.

```sql
SELECT first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 1;
```

9. Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.

```sql
SELECT ROUND(AVG(unit_price), 2)                     AS average_unit_price,
       SUM(units_in_stock)                           AS total_units_in_stock,
       SUM(CASE WHEN discontinued THEN 1 ELSE 0 END) AS total_discontinued_products
FROM products;
```

### Section2: Medium

---

Questions 1- 3

1. Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table

```sql
SELECT p.product_name, s.company_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;
```

2. Show the category_name and the average product unit price for each category rounded to 2 decimal places.

```sql
SELECT c.category_name, ROUND(AVG(p.unit_price), 2) AS average_unit_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;
```

3. Show the city, company_name, contact_name from the customers and suppliers table merged together.
   Create a column which contains 'customers' or 'suppliers' depending on the table it came from.

```sql
SELECT city, company_name, contact_name, 'customers' AS source
FROM customers
UNION ALL
SELECT city, company_name, contact_name, 'suppliers'
FROM suppliers;
```

---

### Section3: Hard

---

Questions 1

1. Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken, and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date, "Late" if the order shipped late. 
   Order by employee last_name, then by first_name, and then descending by number of orders.

```sql
SELECT e.first_name,
       e.last_name,
       COUNT(o.order_id)                                                          AS num_orders,
       CASE WHEN o.shipped_date <= o.required_date THEN 'On Time' ELSE 'Late' END AS shipped
FROM employees e
         JOIN orders o ON e.employee_id = o.employee_id
GROUP BY e.first_name, e.last_name, shipped
ORDER BY e.last_name, e.first_name, num_orders DESC;
```
