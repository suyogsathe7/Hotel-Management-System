set @v1:=(select sum(Quantity*Rate) as total from food
inner join restaurant
on food.FoodID = restaurant.FoodID_FK
where RoomID_FK=id);
select @v1;
insert into pricelog values (@v1,1);
set @var = restaurant.Quantity*food.Rate;