-- TRIGGERS

-- when customer is added, trigger should hit and create a virtual table with customer name and datetime
delimiter %
CREATE TRIGGER tr_customer_forInsert
AFTER INSERT 
ON customer FOR EACH ROW
BEGIN
	     DECLARE vUser varchar(20);
     --   SELECT user() into vUser;
        SELECT `name` from customer where CustomerID = New.CustomerID into Vuser;
        INSERT INTO customer_audit(username,Customer_CustomerID,`Date`) VALUES (vUser,New.CustomerID,current_timestamp()); 
END %
delimiter ;
drop trigger tr_customer_forInsert;
describe customer;
describe customer_audit;




