DELIMITER $$
CREATE PROCEDURE `update_user`(id int,`name` varchar(45),email varchar(45),country varchar(45))
begin
update users
set users.`name` = `name`,
users.email = email,
users.country = country
where users.id = id;
end$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `select_user`()
begin 
select *
from users;
end$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user`(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)
BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$
DELIMITER ;
