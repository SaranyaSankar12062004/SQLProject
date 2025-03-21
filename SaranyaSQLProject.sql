-- create database name as SaranyaSQLProject 
create database SaranyaSQLProject;

-- Use database 
use SaranyaSQLProject;

-- create table Customers with constraints 
create table Customers (
customer_id int primary key,                                       -- Primary Key Constraint 
customer_name varchar(50),                                         -- Varchar Constraint
phone_no varchar(15) unique,                                       -- Unique Constraint 
email_id varchar(100) unique,                                      -- Unique Constraint 
city varchar(50),
district varchar(50),
state varchar(50),
country varchar(50)
);

-- create table Orders with Constraints 
create table Orders (
order_id int primary key,                                          -- Primary Key Constraint 
customer_id int,                                                   -- Foreign key Column 
orderdate datetime default current_timestamp,                      -- Use Current Timestamp 
order_status enum ("Pending","Processing","Shipped","Delivered","Cancelled"),
total_amount int,
foreign key (customer_id) references Customers(customer_id)
on delete cascade                                                  -- Foreign key with Cascade Constraint 
);

-- create table Products with Constraints 
create table Products (
product_id int primary key,                                        -- Primary Key Constraint 
order_id int,                                                      -- Foreign Key Column 
product_name varchar(100),
quantity int,
product_price decimal(10,2),
stock_quantity int,
foreign key (order_id) references Orders(order_id)    
on delete cascade                                                  -- Foreign Key with Cascade Constraint 
);

-- create table OrderDetails with Constraints
create table OrderDetails (
orderdetail_id int primary key,                                    -- Primary Key Constraint
order_id int,
product_id int,
quality int,
product_price decimal(10,2),
total_price int,
foreign key (order_id) references Orders(order_id),                -- Foreign Key for Order Table
foreign key (product_id) references Products(product_id)           -- Foreign Key for Product Table
on delete cascade                                                  -- Cascade Constraint 
);

-- create table Payments with Constraints
create table Payments (
payment_id int primary key,                                        -- Primary Key Constraint
order_id int,
payment_method enum ("Credit Card","Debit Card","UPI","Cash on Delivery"),
transaction_id varchar(50) unique,                                 -- Uinque Constraint
payment_status enum('Pending', 'Completed', 'Failed', 'Refunded'),
amount_paid decimal(10,2),
payment_date datetime default current_timestamp,                   -- Use default timestamp
foreign key (Order_id) references Orders(Order_id)                 
on delete cascade                                                  -- Foreign Key with Cascade Constraint
);

-- create table OrderStatusHistory with Constraint
create table OrderStatusHistory (
order_history_id int primary key,                                  -- Primary Key Constraint
order_id int,
status enum("Pending","Processing","Shipped","Delivered","Cancelled"),
foreign key (order_id) references Orders(order_id)
on delete cascade                                                  -- Foreign Key with Cascade Constraint  
);

-- Create table Discounts with Constraint
create table Discounts (
discount_id int primary key,                                       -- Primary Key Constraint
discount_type enum("Percentage","Fixed Amount","Buy One Get One"),
product_id int,
expiry_date date,
foreign key (product_id) references Products(product_id)
on delete cascade                                                  -- Foreign Key with Cascade Constraint 
);

-- Create table Reviews with Constraint
create table Reviews (
review_id int primary key,                                         -- Primary Key Constraint
product_id int,
customer_id int,
Rating int check (Rating between 1 and 5),
foreign key (product_id) references Products(product_id),          -- Foreign Key for Products Table
foreign key (customer_id) references Customers(customer_id)        -- Foreign Key for Customer Table
on delete cascade                                                  -- Use Cascade Constraint
);

-- Insert values in the Customer table
insert into Customers(customer_id,customer_name,phone_no,email_id,city,district,state,country)
values (1,"Saranya",7604897586,"saranya12@gmail.com","Arni","Thiruvannamalai","Tamilnadu","India"),
(2,"Sankar",8428236771,"sankar16@gmail.com","Cheyyar","Vellore","Tamilnadu","India"),
(3,"Komathi",9876543210,"komathi16@gmail.com","Sevoor","Arcot","Tamilnadu","India"),
(4,"Lokesh",8667788955,"lokesh22@gmail.com","Sriram nagar","Chennai","Tamilnadu","India"),
(5,"Vasantha",8967452310,"vasantha10@gmail.com","Vazhapandal","Ranipet","Tamilnadu","India"),
(6,"Ramesh",9344226744,"ramesh05@gmail.com","Gandhi nagar","Madurai","Tamilnadu","India"),
(7,"Sathya",6381789088,"sathya06@gmail.com","Nehru nagar","Theni","Tamilnadu","India"),
(8,"Praveen kumar",9182736450,"praveen23@gmail.com","Ram nagar","Ooty","Tamilnadu","India"),
(9,"Mahalakshmi",9091234567,"mahalakshmi21@gmail.com","Raj nagar","Kovai","Tamilnadu","India"),
(10,"Thiyagasembal",9012387665,"thiyagasembal23@gmail.com","Anna nagar","Thanjavur","Tamilnadu","India");
select*from Customers;                                              -- Show the Customers table

-- Insert values in the Orders table
insert into Orders(order_id,customer_id,orderdate,order_status,total_amount)
values(101,1,"2025-01-01","Pending",3500),
(102,2,"2025-02-02","Processing",5000),
(103,3,"2025-03-03","Shipped",4000),
(104,4,"2025-04-04","Delivered",2500),
(105,5,"2025-05-05","Cancelled",4500),
(106,6,"2025-06-06","Pending",5500),
(107,7,"2025-07-07","Processing",7000),
(108,8,"2025-08-08","Shipped",3000),
(109,9,"2025-09-09","Delivered",4000),
(110,10,"2025-10-10","Cancelled",4500);
select*from Orders;                                                    -- Show the Orders table

-- Insert values in the Products table
insert into products(product_id,product_name,quantity,product_price,stock_quantity)
values(1, 'Laptop', 10, 7500.99, 150),  
(2, 'Mobile', 15, 4500.49, 300),  
(3, 'Headphones', 20, 2000.99, 500),  
(4, 'Tablet', 8, 8000.99, 75),  
(5, 'Smartwatch', 12, 5000.50, 320),  
(6, 'Mouse', 25, 3000.99, 300),  
(7, 'Keyboard', 18, 6000.99, 150),  
(8, 'Monitor', 15, 9000.99, 60),  
(9, 'Hard Drive', 7, 9900.00, 80),  
(10, 'USB Charger', 30, 2500.99, 500); 
select*from products;                                                   -- Show the Products table

-- Insert values in the OrderDetails table
insert into OrderDetails(orderdetail_id,order_id,product_id,quality,product_price,total_price)
values(1001,101,10,2,2500.99,5000),  
(1002,102,1,3,7500.99,22500),  
(1003,103,2,1,4500.49,4500),  
(1004,104,8,4,9000.99,36000),  
(1005,105,7,1,6000.99,6000),  
(1006,106,9,5,9900.00,49500),  
(1007,107,6,2,3000.99,6000),  
(1008,108,3,4,2000.99,8000),  
(1009,109,5,5,5000.50,25000),  
(1010,110,4,3,8000.99,24000);
select*from OrderDetails;                                              -- Show the OrderDetails table

-- Insert values in the Payments table 
insert into Payments(payment_id,order_id,payment_method, transaction_id,payment_status,amount_paid,payment_date) 
values(501, 101, 'Credit Card', 'TXN123456', 'Completed', 25000, '2025-03-15'),  
(502, 102, 'UPI', 'TXN123457', 'Refunded', 10000, '2025-03-14'),  
(503, 103, 'Debit Card', 'TXN123458', 'Pending', 32000, '2025-03-13'),  
(504, 104, 'Cash on Delivery', 'TXN186735', 'Failed', 7500, '2025-03-12'),  
(505, 105, 'Debit Card', 'TXN123460', 'Completed', 54000, '2025-03-11'),  
(506, 106, 'Credit Card', 'TXN123461', 'Completed', 15000, '2025-03-10'),  
(507, 107, 'Cash on Delivery', 'TXN657483', 'Pending', 9000, '2025-03-09'),  
(508, 108, 'Debit Card', 'TXN123462', 'Completed', 25000, '2025-03-08'),  
(509, 109, 'UPI', 'TXN123463', 'Failed', 25000, '2025-03-07'),  
(510, 110, 'Credit Card', 'TXN123464', 'Completed', 40000, '2025-03-06');  
select*from Payments;                                                  -- Show the Payments table

-- Insert values in the OrderstatusHistory table
insert into OrderStatusHistory(order_history_id,order_id,status)
values(5001, 101, 'Pending'),
(5002, 102, 'Processing'),
(5003, 103, 'Delivered'),
(5004, 104, 'Pending'),
(5005, 105, 'Cancelled'),
(5006, 106, 'Pending'),
(5007, 107, 'Processing'),
(5008, 108, 'Shipped'),
(5009, 109, 'Delivered'),
(5010, 110, 'Processing');
select*from OrderStatusHistory;                                          -- Show the OrderStatusHistory table

-- Insert values in the Discounts table
insert into  Discounts(discount_id,discount_type,product_id,expiry_date)
values(701, 'Percentage', 1, '2025-05-30'),
(702, 'Fixed Amount', 2, '2025-06-20'),
(703, 'Buy One Get One', 3, '2025-07-12'),
(704, 'Percentage', 4, '2025-08-18'),
(705, 'Fixed Amount', 6, '2025-09-20'),
(706, 'Buy One Get One', 5, '2025-10-20'),
(707, 'Percentage', 7, '2025-11-25'),
(708, 'Fixed Amount', 8, '2025-12-30'),
(709, 'Percentage', 9, '2025-11-21'),
(710, 'Buy One Get One', 10, '2025-12-15');
select*from Discounts;                                                   -- Show the Discounts table

-- Insert values in the Reviews table 
insert into Reviews(review_id,product_id,customer_id,Rating)
values(301, 1, 1, 5),
(302, 2, 2, 4),
(303, 3, 3, 2),
(304, 4, 4, 5),
(305, 5, 5, 3),
(306, 6, 6, 3),
(307, 7, 7, 4),
(308, 8, 8, 5),
(309, 9, 9, 4),
(310, 10, 10, 2);
select*from Reviews;                                                       -- Show the Reviews table

 -- Retrive all the values in the Orders table
select*from orders;                                                      
-- Get orders placed by speccific customer who customer_id=101
select*from Orders where customer_id=1;                                   
-- Retrive the Orders placed in last 30 days
select*from Orders where orderdate>=now()-interval 30 day;
-- Get orders details along with Customer information
select o.order_id,o.orderdate,c.customer_name,c.phone_no
       from Orders o 
       join Customers c
       on o.customer_id=c.customer_id;
-- Find the total revenue generated from Orders
select sum(total_amount)as Total_revenue from Orders;
-- Find the most ordered product
select order_id,count(*) as Order_count
       from Orders 
       group by order_id
       order by Order_count DESC
       limit 1;
-- Retrieve customers who have placed more than 5 Orders	
select order_id,avg(total_amount) as Order_Count
       from orders
       group by order_id
       having Order_count>5;
-- Retrive most recent orders for each cutomers
select o1.* from Orders o1 
       where orderdate=(select max(orderdate)
       from Orders o2
       where o1.customer_id=o2.customer_id);
 -- Find the Customer who haven't a Customer_name      
select*from Customers where customer_name not in ("Saranya");
-- Find the customer who have never placed on orders
select*from Customers where customer_id in (select distinct customer_id from orders);
-- Retrive the top 5 most recent Orders
select*from Orders 
       order by orderdate DESC
       limit 5;
-- Retrive the last 5 Orders
select*from Orders 
       order by orderdate ASC
       limit 5;
-- Retrive the product name starts with L letter
select*from Products 
       where product_name like "L%";
-- Retrive the product name ends with d letter 
 select*from Products 
       where product_name like "%d";
-- Retrive the product name have "a" letter in the value 
select*from Products 
       where product_name like "%a%";
-- Retrive the product name starts with T letter and it contains only 5 letter in the values
select*from Products 
       where product_name like "T_____";
-- Find the maximum and minimum values in the column
select max(total_amount),min(total_amount) from Orders;
-- Get a orders completed in the order_status in the Orders table
select order_id,
       case
          when order_status="Pending" then "Processing"
          when order_status="Shipped" then "In Transit"
          else "completed"
          end as order_status
from Orders;
-- Update the order status with the particular order id 
update Orders set order_status="Delivered" where order_id=105;
-- Find the total numberr of products sold in the orderitem table
select sum(total_amount) as total_Products_Sold_price from orders;

-- Create View for Customers table
create view ViewCustomers as 
select customer_id,customer_name,phone_no,email_id,city,district,state,country
from Customers where customer_id=1;
select * from ViewCustomers;                                                     -- Retrieve data from the View table

-- Create View for Orders table 
create view ViewOrders as 
select order_id,orderdate,customer_id,order_status
from Orders where order_status="Pending";
select * from ViewOrders;                                                        -- Retrieve data from the View table

-- Create View to join the tables using primary key
create view ViewProdDisc as
select p.order_id,p.product_name,p.quantity,d.discount_id,d.discount_type
from Products p
join Discounts d                                                                 -- By using Join operator
on p.product_id=d.product_id;
select * from ViewProdDisc;                                                      -- Retrieve data from the View table

  -- Update the quantity for a specific product
create view ViewUpdates as
select product_id,product_name,quantity from products;
update ViewUpdate set quantity = 12 where product_id=1;                          -- Update the values
select * from ViewUpdates;                                                       -- Retrieve data from the View table 

-- Order by the Payment based on the dates with some limits
create view ViewOrder as
select payment_id,order_id,payment_method,transaction_id,payment_status,amount_paid,payment_date
from payments
order by payment_date limit 5;
select * from Vieworder;                                                         -- Retrieve data from the View table                                 

--  Create procedure to get a  Customers details and Order details - WithoutParameter
Delimiter //
create procedure Details_Cust_Orders()
begin
select*from Customers;                                                           -- Retrieve the Customers data 
select*from orders;                                                              -- Retrieve the Orders data
end //
Delimiter ;
call Details_Cust_Orders();                                                      -- Call the Procedure

-- Create a procedure to get a orders based on the customer_id - without Parameter
Delimiter //
create procedure Getcustorder()
begin
select *from Orders where customer_id=1;                                         -- Retrieve data based on customer_id
end //
Delimiter ;
call Getcustorder();                                                             -- Call the Procedure

-- Get a Customers details by passing a  input paramters in the procedure[with Parameter]
Delimiter //
create procedure Getcustnames(in n varchar(50))
begin
select customer_name from Customers
where Customer_name=n;
select customer_name from Customers where country="India";
end //
Delimiter ;
call Getcustnames("Sankar");                                                     -- Call the Procedure

-- Insert values in the procedure table by passing a input parameters 
Delimiter //
create procedure insertorders(
in porder_id int,
in pcustomer_id int,
in porderdate datetime,
in porder_status enum("Pending","Processing","Shipped","Delivered","Cancelled"),
in ptotal_amount int 
)
begin
insert into Orders(order_id,customer_id,orderdate,order_status,total_amount)
values(porder_id,pcustomer_id,porderdate,porder_status,ptotal_amount);           -- Insert values 
end //
Delimiter ;
SET FOREIGN_KEY_CHECKS = 0;                                                      -- Safe updates for Foreign Key
CALL insertorders(111, 11, '2025-12-12', 'Processing', 50000);                   -- Call the Procedure 
SET FOREIGN_KEY_CHECKS = 1;                                                      

-- select a particular customers order details by using order id
Delimiter //
create procedure selectorder()
begin
select order_id,customer_id,order_status from Orders where order_id=110;         -- Retrieve data based on order_id
end //
Delimiter ;
call selectorder();                                                              -- Call the Procedure

-- Get a Customers data by using foreign key constraint
Delimiter //
create procedure Getcnames1(
in ccust_id int,
in ccust_name varchar(50)
)
begin
select customer_id,customer_name from Customers where customer_id=ccust_id and customer_name=ccust_name;
select customer_id,customerr_name from Customers where email_id="cemail_id";
end //
Delimiter ;
call Getcnames1(1,"Saranya");                                                      -- Call the Procedure

-- Input values are passing to the Procedure to retrieve the data
Delimiter //
create procedure Getcnamess(                                                     -- With Parameter
in ccust_id int,                                                                 -- By passing a Input parameters
in ccust_name varchar(50),
in cphone_no varchar(15),
in cemail_id varchar(100),
in ccity varchar(50),
in cdist varchar(50),
in cstate varchar(50),
in ccountry varchar(50)
)
begin
select * from Customers where customer_id=ccust_id and customer_name=ccust_name;
select * from Customers where email_id=cemail_id;
end //
Delimiter ;
call Getcnamess(1, 'Saranya', '7604897586', 'saranya12@gmail.com', 'Arni', 'Thiruvannamalai', 'Tamilnadu', 'India');
                                                                                    -- Call the Procedure

-- Retrieve data based on the current timestamp
Delimiter //
create procedure Getdate()
begin
select*from Orders where orderdate>=now()-interval 30 day;
end //
Delimiter ;
call Getdate();                                                                     -- Call the procedure

-- Retrieve data by using a Join operation to join the two tables 
Delimiter //
create procedure Getoc()
begin
select o.order_id,o.orderdate,c.customer_name,c.phone_no
       from Orders o 
       join Customers c
       on o.customer_id=c.customer_id;
end //
Delimiter ;
call Getoc();                                                                 -- Call the Procedure

-- Get a Total revenue of the orders
Delimiter //
create procedure Getsum()
begin
select sum(total_amount)as Total_revenue from Orders;
end //
Delimiter ;
call Getsum();                                                                 -- Call the Procedure

-- Count the orders and group by the column based on the orders with some limits
Delimiter //
create procedure Getcount()
begin
select order_id,count(*) as Order_count
       from Orders 
       group by order_id
       order by Order_count DESC
       limit 1;
end //
Delimiter ;
call Getcount();                                                              -- Call the Procedure

-- Count the orders and group by the column based on the orders with some limits
Delimiter //
create procedure Getcounts()
begin
select order_id,count(*) as Order_count
       from Orders 
       group by order_id
       order by Order_count ASC
       limit 7;
end //
Delimiter ;
call Getcounts();                                                                -- Call the Procedure

-- Get the Average amount for the Orders by using a group by function and having function 
Delimiter //
create procedure Getavg()
begin
select order_id,avg(total_amount) as Order_Count
       from orders
       group by order_id
       having Order_count>5;
end //
Delimiter ;
call Getavg();                                                                      -- Call the Procedure

-- select the total count from Order table using Output parameter
Delimiter //
create procedure count_order(
out Total int)                                                                     -- Define the output Parameter
begin
select count(*) into Total from Orders;
end //
Delimiter ;
call count_order(@Total);                                                            -- Call the Procedure
select @Total;                                                                       -- Select the procedure
select*from Orders;                                                                  -- Select the order table

-- Delete data from the table based on the Order_id
Delimiter //
create procedure deleteorder()
begin
delete from Orders where order_id=111;
end //
Delimiter ;
call deleteorder();                                                                   -- Call the Procedure
select*from Orders;                                                                   -- Select the Order table

-- Get the Average price of the Orderdetails table 
Delimiter //
create procedure avg_count (
out total_orders int)                                                                 -- By using Output parameter
begin
select avg(total_price) into total_orders from Orderdetails;                          -- Get average price
end //
Delimiter ;
call avg_count(@total_orders);                                                        -- Call the Procedure
select @total_orders;                                                                 -- Retrieve the Procedure Data   

-- Get the Maximum price for the table 
Delimiter //
create procedure maxorder(
out maximumorder int)                                                                 -- By using Output parameter
begin
select max(total_price) into maximumorder from orderdetails;                          -- Get the Maximum price
end //
Delimiter ; 
call maxorder(@maximumorder);                                                         -- Call the Procedure
select @maximumorder;                                                                 -- Retrieve the Procedure Data  

-- Get the Minimum price for the table
Delimiter //
create procedure minorder(
out minimumorder int)                                                                 -- By using Output Parameter
begin
select min(total_price) into minimumorder from orderdetails;                          -- Get the Minimum price
end //
Delimiter ; 
call minorder(@minimumorder);                                                         -- Call the Procedure
select @minimumorder;                                                                 -- Retrieve the Procedure Data  
select*from orderdetails;                                                             -- select the data

-- Get the Maximum price for the table 
Delimiter //
create procedure maxdata(
out maximumdata int)                                                                   -- By using output parameter
begin
select max(total_price) from orderdetails;                                             -- Get the Maximum price
end //
Delimiter ; 
call maxorder(@maximumdata);                                                           -- Call the Procedure
select @maximumdata;                                                                   -- Retrieve the Procedure Data 

-- Get the Minimum price for the table
Delimiter //
create procedure mindata(
out minimumdata int)                                                                    -- By using Output parameter                                                 
begin
select min(total_price) from orderdetails;                                              -- Get the Minimum price
end //
Delimiter ; 
call minorder(@minimumdata);                                                            -- Call the Procedure
select @minimumdata;                                                                    -- Retrieve the Procedure Data 
select * from Orderdetails;                                                             -- Retrieve data