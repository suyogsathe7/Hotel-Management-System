SELECT * FROM hotelmanagement.restaurant;

INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('1', '101', '1', '3', '2017-12-06', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('2', '201', '3', '1', '2017-11-21', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('3', '102', '2', '5', '2017-10-12', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('4', '202', '2', '12', '2017-12-07', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('5', '102', '1', '3', '2017-12-08', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('6', '301', '3', '7', '2017-12-09', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('7', '303', '3', '2', '2017-12-10', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('8', '303', '2', '1', '2017-12-11', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('9', '300', '2', '3', '2017-12-12', '1');
INSERT INTO `hotelmanagement`.`restaurant` (`RestaurantID`, `RoomID_FK`, `FoodID_FK`, `Quantity`, `ServeDate`, `Hotel_HotelID`) VALUES ('10', '200', '1', '1', '2017-12-13', '1');

truncate table restaurant;