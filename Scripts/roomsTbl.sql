select * from rooms;

INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('101', '1', '2',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('102', '2', '5',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('103', '3', '4',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('201', '3', '3',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('202', '2', '1',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('203', '3', '4',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('301', '1', '3',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('302', '2', '2',false);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('303', '3', '1',false);

INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('104', '1', null,true);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('204', '2', null,true);
INSERT INTO `hotelmanagement`.`rooms` (`RoomID`, `RoomTypeID_FK`, `BookingID_FK`,`availability`) VALUES ('304', '3', null,true);
truncate table rooms;