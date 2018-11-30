DELIMITER $$
CREATE EVENT customerBackups ON schedule every 5 hour starts '2017-12-13 08:30:00'
do begin
select * into outfile 'C:\STUDY\DBMS\eg.csv' from customer;
end $$
delimiter ; 

drop event customerBackups;