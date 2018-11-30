SELECT * FROM hotelmanagement.roomtype;

INSERT INTO `hotelmanagement`.`roomtype` (`RoomTypeID`, `roomType`, `price`) VALUES ('1', 'Deluxe', '400');
INSERT INTO `hotelmanagement`.`roomtype` (`RoomTypeID`, `roomType`, `price`) VALUES ('2', 'Premium', '500');
INSERT INTO `hotelmanagement`.`roomtype` (`RoomTypeID`, `roomType`, `price`) VALUES ('3', 'Supreme', '600');

truncate table roomtype;

describe hotelmanagement.roomtype;