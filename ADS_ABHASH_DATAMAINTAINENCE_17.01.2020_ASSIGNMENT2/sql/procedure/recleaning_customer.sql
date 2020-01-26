create or replace procedure recleaning_customer
is
customer_id good_customer.customer_id%type;
CUSTOMER_TYPE good_customer.CUSTOMER_TYPE%type;
	CUSTOMER_MILES good_customer.CUSTOMER_MILES%type;
	CUSTOMER_key good_customer.CUSTOMER_key%type;
	
cursor recleaning_cursor_customer
is
select customer_id,
	CUSTOMER_TYPE,
	CUSTOMER_MILES,
	CUSTOMER_key
    from good_customer;
BEGIN
OPEN
recleaning_cursor_customer;
LOOP
FETCH
recleaning_cursor_customer into customer_id,
	CUSTOMER_TYPE,
	CUSTOMER_MILES,
	CUSTOMER_key;
EXIT WHEN
recleaning_cursor_customer%notfound;
insert into reclean_customer values(recleancustomer_sequence.nextval, 
                                   CUSTOMER_TYPE,
	CUSTOMER_MILES,
	CUSTOMER_key,
                                     '-');
update reclean_customer set message = 'Data has been changed' where (CUSTOMER_ID = 1 AND CUSTOMER_MILES=10000) OR (CUSTOMER_ID = 2 AND CUSTOMER_MILES=10000) OR (CUSTOMER_ID = 3 AND CUSTOMER_MILES=20000);
END LOOP;
CLOSE recleaning_cursor_customer;
END;

BEGIN
recleaning_customer;
END;