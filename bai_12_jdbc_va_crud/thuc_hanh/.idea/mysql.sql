SELECT * FROM demonew.users;
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');


select *
from demonew.users
where  name like ?;


