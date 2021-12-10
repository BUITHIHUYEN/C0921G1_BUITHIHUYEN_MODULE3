drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
customer_id int primary key,
customer_name varchar(50),
customer_age int
);
create table `order`(
order_id int primary key,
customer_id int,
foreign key (customer_id) references customer(customer_id),
order_date date,
order_total_price int
);
create table product(
product_id int primary key,
product_name varchar(50),
product_price int
);
create table order_detail(
order_id int,
foreign key (order_id) references `order`(order_id),
product_id int,
foreign key (product_id) references product (product_id),
order_qty int
);
