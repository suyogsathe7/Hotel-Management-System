-- procedure for viewing the restaurant bill
-- ROOM (FOOD RES) PRICELOG
DELIMITER //
CREATE PROCEDURE proc_res_bill(IN id INT(10))
BEGIN
SELECT RoomID_FK AS `Room No`,`Type` AS `Food Type Ordered`,sum(Quantity*Rate) as Amount
FROM food
INNER JOIN restaurant
ON food.FoodID = restaurant.FoodID_FK
where RoomID_FK=id
group by `Type` with rollup;
END //
DELIMITER ; 

DROP PROCEDURE proc_res_bill;

CALL proc_res_bill(102);

------------------------------------------------------------------------------------------

-- procedure for viewing the hotel bill
-- customer booking room roomtype add customer name room no
DELIMITER //
CREATE PROCEDURE proc_hotel_bill(IN id INT(10))
BEGIN
select CustomerID, `name`, roomType, CheckOUT-CheckIN as `Days Stayed`,SUM((CheckOUT-CheckIN)*price) as `Total`
from customer
inner join booking
on customer.CustomerID = booking.CustomerID_FK
inner join rooms 
on booking.BookingID = rooms.BookingID_FK
inner join roomtype
on rooms.RoomTypeID_FK = roomtype.RoomTypeID
where CheckIN is not null and CheckOUT is not null and CustomerID=1
group by roomType with rollup;
END //
DELIMITER ; 

DROP PROCEDURE proc_hotel_bill;

CALL proc_hotel_bill(1);

------------------------------------------------------------------------------------------------------------------
-- total bill and details while checkoing out

DELIMITER //
CREATE PROCEDURE proc_invoice(IN id INT(10))
BEGIN
SELECT BookingID,`name` AS `Name`,CheckIN, CheckOUT , sum(Quantity*Rate) AS `Restaurant Bill`, (CheckOUT-CheckIN)*price as `Hotel Bill` ,sum(Quantity*Rate)+((CheckOUT-CheckIN)*price) as `Total Bill`
FROM customer
INNER JOIN booking
ON customer.CustomerID = booking.CustomerID_FK
INNER JOIN rooms
ON booking.BookingID = rooms.BookingID_FK
INNER JOIN roomtype
ON rooms.RoomTypeID_FK = roomtype.RoomTypeID
INNER JOIN restaurant 
ON rooms.RoomID = restaurant.RoomID_FK
INNER JOIN food 
ON restaurant.FoodID_FK = food.FoodID
where CheckIN is not null and CheckOUT is not null and BookingID=id
group by name
order by BookingID;
end //
delimiter ;

drop procedure proc_invoice;
call proc_invoice(2);

---------------------------------------------------------------------------------------

-- backup customers as per the booking 

DELIMITER ##
CREATE PROCEDURE backup_customer_details()
BEGIN
CREATE TABLE newCustomer AS SELECT * FROM customer;
CREATE TABLE onlineCustomer AS SELECT * FROM customer WHERE Booking="Online";
CREATE TABLE offlineCustomer AS SELECT * FROM customer WHERE Booking="Offline";
END ##
Delimiter ;

drop procedure if exists backup_customer_details;

call backup_customer_details();
select * from offlinecustomer;
select * from onlinecustomer;
select * from newcustomer;

drop table newcustomer;
drop table onlinecustomer;
drop table offlinecustomer;



---------------------------------------------------------------------------------------------------------- 

-- to count the number of rooms available where booking id is null
delimiter $$
create procedure count_rooms()
begin
select roomType as `Room Type`,count(rooms.Availability)as `Available Rooms`  from rooms
inner join roomtype
on rooms.RoomTypeID_FK = roomtype.RoomTypeID
where BookingID_FK is null
group by roomType;

end $$
delimiter ;

drop procedure if exists count_rooms;

call count_rooms();

----------------------------------------------------------------------------------------------------------

DELIMITER ##
CREATE PROCEDURE shift_details()
BEGIN
CREATE TABLE morningShift AS SELECT * FROM employees WHERE shift="Morning";
CREATE  TABLE afternoonShift AS SELECT * FROM employees WHERE shift="Afternoon";
CREATE TABLE eveningShift AS SELECT * FROM employees WHERE shift="Evening";
CREATE TABLE nightShift AS SELECT * FROM employees WHERE shift="Night";
END ##
Delimiter ;

drop procedure if exists shift_details;

call shift_details();

select * from morningshift;
select * from afternoonshift;
select * from eveningshift;
select * from nightshift;

drop table morningshift;
drop table afternoonshift;
drop table eveningshift;
drop table nightshift;
