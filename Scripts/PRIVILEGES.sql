-- select privilige

create user 'suyog'@'localhost' identified by 'suyog'; 
grant select on  `HotelManagement`.* to 'suyog'@'localhost';
show grants for 'suyog'@'localhost';
-- uodate,delete give select privilege

drop user 'suyog'@'localhost';

-----------------------------------------------------

-- execute and select privilge

create user 'mayur'@'localhost' identified by 'mayur'; 
grant select,execute on  `HotelManagement`.* to 'mayur'@'localhost';
show grants for 'mayur'@'localhost';

drop user 'mayur'@'localhost';

----------------------------------------------------

-- update select privilige

create user 'chai'@'localhost' identified by 'chai'; 
grant update,select on  `HotelManagement`.* to 'chai'@'localhost';
show grants for 'chai'@'localhost';

drop user 'chai'@'localhost';

---------------------------------------------------

-- delete select privilige

create user 'chinmay'@'localhost' identified by 'chinmay'; 
grant delete,select on  `HotelManagement`.* to 'chinmay'@'localhost';
show grants for 'chinmay'@'localhost';

drop user 'chinmay'@'localhost';

----------------------------------------------------

-- select, update, delete

create user 'rohan'@'localhost' identified by 'rohan'; 
grant update,delete,select on  `HotelManagement`.* to 'rohan'@'localhost';
show grants for 'rohan'@'localhost';

drop user 'rohan'@'localhost';

--------------------------------------------------

-- speccific columns

create user 'ankur'@'localhost' identified by 'ankur'; 
grant select(Availability) on  `HotelManagement`.`rooms` to 'ankur'@'localhost';
show grants for 'ankur'@'localhost';

drop user 'ankur'@'localhost';











