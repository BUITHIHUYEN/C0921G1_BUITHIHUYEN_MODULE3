-- tạo csdl tên demo
create database demo;
-- tạo bảng và thêm dữ liệu vào bảng products
create table products(
id int primary key,
product_code int,
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status varchar(50)
);

insert into products
values
(1,111,'itel',200000,2,'China','100%'),
(2,222,'SamSung J7 Prime',3000000,4,'Korea','99%'),
(3,333,'Iphone 12 Promax',36000000,1,'U.S','100%');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index index_product_code 
on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index index_prodcut_name_price
on products(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select product_name,product_price from products
where product_name = 'Iphone 12 Promax';

-- So sánh câu truy vấn trước và sau khi tạo index


-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as 
select product_code,
product_name,
product_price,
product_status
from products;
select * from product_view;

-- Tiến hành sửa đổi view
create or replace view product_view as
select product_code,
product_name,
product_price,
product_status
from products;

-- Tiến hành xoá view
drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_find_products()
begin
select * from products;
end;
// delimiter ;
call sp_find_products();


-- Tạo store procedure thêm một sản phẩm mới
delimiter // 
create procedure new_product (id int,
product_code int,
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status varchar(50))
begin
insert into products
values(id,product_code,product_name,product_price,product_amount,product_description,product_status);
end;
// delimiter ;

call new_product(4,444,'Iphone 10',20000000,1,'U.S','100%');

-- -- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product (id int ,
product_code int,
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status varchar(50))
begin 
update products
set product_code=product_code,product_name=product_name,product_price=product_price,product_amount=product_amount,product_description=product_description,product_status=product_status
where products.id=id;
end; //
delimiter ;
call edit_product(4,444,'Iphone 10',20000000,6,'U.S','100%');

-- -- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product (id int)
begin 
delete 
from products
where products.id=id;
end; //
delimiter ;
call delete_product(4);





























