CREATE OR REPLACE PROCEDURE load_customer
IS
BEGIN
INSERT INTO bad_customere (customer_id,customer_type,customer_miles,customer_key)
                         
SELECT customer_id,customer_type,customer_miles,customer_key from 
END;

BEGIN
load_customer;
END;