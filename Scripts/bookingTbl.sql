SELECT * FROM hotelmanagement.booking;

truncate table hotelmanagement.booking; 

insert into hotelmanagement.booking values('1', '1', '2017-12-06', '2017-12-09', NULL);
insert into hotelmanagement.booking values('2', '2', '2017-10-15', '2017-10-22', NULL);
insert into hotelmanagement.booking values('3', '3', '2017-10-22', '2017-10-23', NULL);
insert into hotelmanagement.booking values('4', '4', '2017-11-17', NULL, NULL);
insert into hotelmanagement.booking values('5', '5', '2017-12-11', '2017-12-13', NULL);
insert into hotelmanagement.booking values('6', '6', '2017-12-06', '2017-12-09', NULL);
insert into hotelmanagement.booking values('7', '7', '2017-12-01', NULL, NULL);
insert into hotelmanagement.booking values('8', '8', '2017-12-27', '2017-12-28', NULL);
insert into hotelmanagement.booking values('9', '9', '2017-08-17', NULL, NULL);
insert into hotelmanagement.booking values('10', '10', '2017-10-22', NULL, NULL);

-- three conditions
-- customer checkin but did not checkout
-- customer checked out
-- customer didnt come yet