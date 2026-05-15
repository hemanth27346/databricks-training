# Week 1 - Day 3

## 📌 Day 3 Learning Track (Window Functions + CTEs)

### Dataset / Schema Setup

- Practice schema (PostgreSQL compatible) created in `Schema.sql`
- Tables:
  - `employees` (department, salary, manager hierarchy)
  - `customers` (customer master)
  - `orders` (customer orders handled by employees)
- Designed for analytics scenarios:
  - salary-based ranking and department comparisons
  - customer order timelines for `LAG` / `LEAD`
  - employee-wise and department-wise sales analysis
  - manager hierarchy for recursive CTE practice

### Window Functions Covered

- Ranking functions:
  - `ROW_NUMBER`
  - `RANK`
  - `DENSE_RANK`
  - `NTILE`
- Aggregate windows:
  - `SUM() OVER(...)`
  - `AVG() OVER(...)`
  - `MAX() OVER(...)`
  - `COUNT() OVER(...)`
- Navigation functions:
  - `LAG`
  - `LEAD`
- Running and moving calculations:
  - running totals
  - cumulative sums
  - moving average (`ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`)

### CTE and Recursive CTE Practice

- Single CTE for reusable aggregates (employee sales, order average filtering)
- Multiple CTE chaining for staged calculations (totals + rankings + company average comparison)
- Recursive CTE examples:
  - number generation (1 to 10)
  - employee-manager hierarchy expansion

### Assignment Work (Questions 1-30)

Implemented in `Window_Functions.sql`:

- Salary ranking and top-N employee extraction
- Department-wise ranking, max salary, payroll, and average comparison
- Running total / cumulative sales / moving average over orders
- Previous and next order analysis with `LAG` and `LEAD`
- Customer spending totals and ranking reports
- Employees above department average salary
- Percentage salary contribution within each department
- Total employees count displayed with each row
- CTE-based sales filters and company-average comparisons
- Recursive hierarchy and advanced top-performer selection per department

-- SQL Window Functions and CTE Assignment
-- Compatible with PostgreSQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    manager_id INT NULL,
    salary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert Employees
INSERT INTO employees VALUES
(1, 'Alice Johnson', 'Sales', NULL, 70000, '2020-01-15'),
(2, 'Bob Smith', 'Sales', 1, 65000, '2021-03-20'),
(3, 'Charlie Brown', 'IT', NULL, 90000, '2019-07-01'),
(4, 'Diana Prince', 'IT', 3, 95000, '2018-11-11'),
(5, 'Ethan Hunt', 'HR', NULL, 60000, '2022-02-10'),
(6, 'Fiona Green', 'HR', 5, 58000, '2023-05-12'),
(7, 'George Miller', 'Finance', NULL, 85000, '2017-09-18'),
(8, 'Hannah Lee', 'Finance', 7, 82000, '2021-08-30');

-- Insert Customers
INSERT INTO customers VALUES
(1, 'Acme Corp', 'New York'),
(2, 'Tech Solutions', 'Chicago'),
(3, 'Global Retail', 'Dallas'),
(4, 'Blue Sky Ltd', 'Seattle'),
(5, 'NextGen Systems', 'Boston');

-- Insert Orders
INSERT INTO orders VALUES
(101, 1, 1, '2024-01-10', 500),
(102, 2, 2, '2024-01-11', 700),
(103, 1, 1, '2024-01-15', 1200),
(104, 3, 3, '2024-01-18', 300),
(105, 4, 4, '2024-01-20', 900),
(106, 5, 2, '2024-01-25', 1500),
(107, 2, 1, '2024-02-01', 650),
(108, 1, 3, '2024-02-05', 1100),
(109, 3, 4, '2024-02-10', 400),
(110, 4, 2, '2024-02-15', 950),
(111, 5, 1, '2024-02-20', 2000),
(112, 1, 4, '2024-02-25', 750);

-- Notes:
-- Multiple departments for PARTITION BY exercises.
-- Salary variations for ranking exercises.
-- Multiple customer orders for LAG/LEAD analysis.
-- Manager hierarchy included for recursive CTE practice.