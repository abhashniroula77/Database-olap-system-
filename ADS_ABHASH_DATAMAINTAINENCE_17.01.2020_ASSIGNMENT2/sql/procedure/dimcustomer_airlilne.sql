CREATE OR REPLACE PROCEDURE dimcustomer_AIRLINE
IS
BEGIN
INSERT INTO dim_customer (customer_id, customer_type,customer_miles,customer_key)
                         
SELECT customer_id, customer_type,customer_miles,customer_key from good_customer;
END;

BEGIN
dimcustomer_AIRLINE;
END;

