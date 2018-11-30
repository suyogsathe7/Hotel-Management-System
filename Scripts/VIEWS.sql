-- VIEWS

-- TO SHOW THE DETAILS OF THE BOOKING

DROP VIEW IF EXISTS BookingDetails;

DROP TABLE IF EXISTS BookingDetails;

CREATE VIEW BookingDetails AS
SELECT BookingID,name as `Customer Name`,CheckIN as `Check In Date`, CheckOUT as `Check out Date`,Booking AS `Booking Type`
FROM booking
INNER JOIN customer
ON booking.CustomerID_FK = customer.CustomerID
WHERE BookingID IS NOT NULL
ORDER BY BookingID;

SELECT * FROM BookingDetails; -- done

---------------------------------------------------------------------------------------------------
-- TO CHECK WHETHER THE ROOM IS BOOKED OR NOT

DROP VIEW IF EXISTS room_status;

DROP TABLE IF EXISTS room_status;

CREATE VIEW room_status AS
SELECT RoomID AS `Room Number`, RoomType, CheckOUT AS `Check Out Date` 
FROM booking
INNER JOIN rooms
ON booking.BookingID = rooms.BookingID_FK
INNER JOIN roomtype
ON rooms.RoomTypeID_FK = roomtype.RoomTypeID 
ORDER BY RoomID;
											
SELECT * FROM room_status;

-----------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------

-- TO SHOW THE DETAILS OF THE FOOD CUSTOMER ORDERED

DROP VIEW IF EXISTS food_details;

DROP TABLE IF EXISTS food_details;

CREATE VIEW food_details AS
SELECT RoomID AS `Room Number`,Type AS `Food`, Quantity, Rate, Quantity*Rate AS Amount, ServeDate AS `Date of Food Served`
FROM rooms
INNER JOIN restaurant 
ON rooms.RoomID = restaurant.RoomID_FK
INNER JOIN food 
ON restaurant.FoodID_FK = food.FoodID             -- done
ORDER BY RoomID;

SELECT * FROM food_details;

-----------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------
-- TO CHECK THE NUMBER OF DAYS THE CUSTOMER STAYED

-- ROOM ID, CUSTOMER NAME, ROOMTYPE, BO 
-- CUSTOMER BOOKING ROOM
drop view if exists stayDays;

drop table if exists stayDays;

CREATE VIEW stayDays AS
SELECT RoomID AS `Room Number`, name AS `Customer Name`, roomType AS `Room Type`, BookingID, CheckOUT-CheckIN AS `No of Days Stayed`
FROM customer
INNER JOIN booking
ON customer.CustomerID = booking.CustomerID_FK
INNER JOIN rooms 
ON booking.BookingID = rooms.BookingID_FK
RIGHT OUTER JOIN roomtype 
ON rooms.RoomTypeID_FK = roomtype.RoomTypeID
WHERE BookingID IS NOT NULL and CheckIN is not null and CheckOUT is not null -- done
ORDER BY RoomID;

select * from stayDays;


---------------------------------------------------------------------------------------------------------------------
