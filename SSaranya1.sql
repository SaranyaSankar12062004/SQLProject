create database SSaranya1;
use SSaranya1;
create table Customer(
customer_id int primary key,
first_name varchar(20) not null,
last_name varchar(10),
age int check(age>=18),
country varchar(20) default "india"
);

insert into Customer(customer_id,first_name,last_name,age,country)
values(1,"John","Doe",31,"USA"),
(2,"Saranya","s",21,"UK"),
(3,"Lokesh","s",20,"India"),
(4,"Sankar","r",48,"USA"),
(5,"komathi","s",45,"Arab");
select*from Customer;

create table Orders(
order_id int primary key,
item varchar(20) not null,
amount int,
customer_id int);
insert into Orders(order_id,item,amount,customer_id)
values(1,"Keyboard",400,4),
(2,"Mouse",300,4),
(3,"Monitor",12000,3),
(4,"Keyboard",400,1),
(5,"Mousepad",250,2);
select*from Orders;
use SSaranya1;
select*from Customer;
alter table Customer
add column email_id varchar(20);
select*from Customer;
alter table customer
drop column email_id;
select*from Customer;
alter table Customer 
rename column country to countries;
select*from Customer;
alter table customer
change column countries country varchar(50);
select*from Customer;
rename table Orders to Purchase;
select*from Purchase;
rename table Purchase to Orders;
select*from Orders;
set sql_safe_updates=0;
delete from Orders where customer_id=1;
set sql_safe_updates=1;
select*from Orders;
set sql_safe_updates=0;
update Orders set amount=500
where customer_id=2;
set sql_safe_updates=1;
select*from Orders where item="mouse";
select amount from Orders where amount>500;
select amount from Orders where amount<500;
select*from Orders where amount>500;
select*from Orders;
select order_id,item,amount from Orders
where customer_id=3 and amount>1000;
select*from Orders where item="Keyboard" or amount=500;
select*from Orders where item="Keyboard" or amount=1000;
select*from Orders where item in ("Mouse","Keyboard");
select item from Orders where item in ("Mouse","Keyboard");
select*from Orders;
select*from Orders where item like "M%";
select*from Orders where item like "%M";
select*from Orders where item like "%M%";
select*from Orders where item like "_K";
select*from Orders where item like "K_";
select*from Orders where item like "M%e";
select*from Orders where item like "_r";
select*from Orders where item like "m_";
select*from Orders where item like "%m";
select*from Orders where binary item like "M%";
select*from Orders where lower(item) like "m%";
select*from Orders where item="Mouse" limit 1;
select amount from Orders where item="Mouse" limit 1;
select amount from orders order by amount ASC;
select amount from orders order by amount DESC;
select amount from orders order by amount ASC limit 3;
select amount from orders where item="Mouse" order by amount ASC limit 2;
select distinct item from Orders;
select distinct item,amount from Orders;
select distinct item from Orders order by item limit 1 offset 1;
select distinct item from Orders where item="Monitor" order by item limit 1 offset 1;

select count(*) from Customer;
select count(*) from Orders;
select count(amount) from Orders;
select sum(amount)from Orders;
select sum(amount) as total_amount from Orders;
select sum(amount) as total_amount,customer_id from Orders group by customer_id;
select sum(amount) as total_amount,customer_id from Orders group by customer_id having sum(amount)>=500;
select avg(amount) from Orders;
select avg(item)from Orders;
select avg(age)from Customer;
select min(age)from Customer;
select max(age)from Customer;
select max(amount) as maximum_Amount,customer_id from Orders group by customer_id;
select max(amount) as maximum_Amount,customer_id from Orders group by customer_id having customer_id=3;
select max(amount) as maximum_Amount,customer_id from Orders group by customer_id having customer_id=1;
select round(75.321,2) from customer;
select round(12345.6789,5);


select length('Hello');
select length(' Hello ');
select concat('Hello','World');
select concat('Hi','Hello','World');
select concat(1,2);
select concat('Hello',space(5),'World');
select concat(first_name,last_name)as Concat_string from customer;
select lower("SARANYA");
select lcase("SARANYA");
select upper("saranya");
select ucase("saranya");
select substring('Hello',2,3);
select substring('He llo',2,3);
select trim(' Hello ');
select trim(' Hello');
select trim('Hello ');
select ltrim(' Hello');
select rtrim('Hello ');
select replace('Hello World','World','SQL');
select reverse('AYNARAS');
select left('Hello',2);
select right('Hello',3);
select locate('l','Hello');
select locate("ran","Saranya");
select field('Apple','Orange','Banana','Apple','Grapes');
select strcmp('first_name','last_name')from customer;
select strcmp('first_name','first_name') from customer;
select strcmp('customer_id','order_id') from orders;
select ascii("A");
select repeat("Saranya",7);
select find_in_set("a","S,a,r,a,n");
select lpad("SQL",5,"0") as leftpaddingstring;
select rpad("SQL",5,"0") as rightpaddingstring;
select format(123456789,"#####-####");

