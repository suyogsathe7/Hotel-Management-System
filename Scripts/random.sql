create view example as
SELECT RoomID_FK AS `Room No`,`Type` AS `Food Type Ordered`, Quantity,Rate,Quantity*Rate AS `Total`
FROM food
INNER JOIN restaurant
ON food.FoodID = restaurant.FoodID_FK
where RoomID_FK=101
GROUP BY `Type`;

drop view example;
select sum(Total) from example;

select * from example;

delimiter @
create procedure eg(IN id INT)
begin
create view example as
SELECT RoomID_FK AS `Room No`,`Type` AS `Food Type Ordered`, Quantity,Rate,Quantity*Rate AS `Total`
FROM food
INNER JOIN restaurant
ON food.FoodID = restaurant.FoodID_FK
where RoomID_FK=id
GROUP BY `Type`;
end @
delimiter ;