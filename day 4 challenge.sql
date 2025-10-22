create database generalshop;
use generalshop;

create table products(
product_id int primary key,
product_name varchar (100), 
product_price int,
quantity int
);

insert into products values
(1001, "washing machine", 42000, 10),
(1002, "air conditioner", 35000, 15),
(1003, "television", 50000, 20),
(1004, "fridge", 28000, 25);


create table sales(
sales_id int primary key,
customer_id int,
customer_name varchar (50),
product_id int,
foreign key (product_id) references products(product_id),
sales_price int,
sales_quantity int,
total_amount int
);

insert into sales VALUES
(401, 243, "kavya", 1001, 42000, 2, 84000),
(402, 244, "gayathri", 1002, 35000, 1, 35000),
(403, 245, "anandhan", 1003, 50000, 2, 100000),
(404, 246, "siva kumar", 1004, 28000, 3, 84000);

create table employees(
employee_id int primary key,
employee_name varchar (50),
department_id int,
department_name varchar(50)
);

INSERT INTO employees values 
(111, "selvam", 1, "PRODUCTION"),
(112, "hari ", 2, "SALES"),
(113, "shanmugam", 3, "ACCOUNTS");

-- ORDER BY & LIMIT --
select * FROM products order by product_price desc limit 3;

-- AGGREGATE FUNTIONS --
select count(*) as total_sales from sales;

select sum(total_amount) as total_revenue from sales;

select avg(total_amount) as average_sales_value from sales;

select max(total_amount) as highest_sale from sales;

select min(total_amount) as lowest_sale from sales;

-- GROUP BY& HAVING --
SELECT department_id, count(employee_id) as total_employees from employees
group by department_id having count(employee_id) >10;