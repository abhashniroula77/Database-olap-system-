create or replace procedure CUSTOMER_CLEAN
is
CUSTOMER_id good_customer.CUSTOMER_id%type;
CUSTOMER_TYPE good_customer.CUSTOMER_TYPE%type;
CUSTOMER_MILES good_customer.CUSTOMER_MILES%type;
CUSTOMER_key good_customer.CUSTOMER_type%type;
cursor bad_cursor_customer
is
select * from BAD_CUSTOMER;
BEGIN
OPEN
bad_cursor_customer;
LOOP
FETCH
bad_cursor_customer into CUSTOMER_id, CUSTOMER_TYPE, CUSTOMER_MILES, CUSTOMER_key;
EXIT WHEN
bad_cursor_customer%notfound;
insert into GOOD_CUSTOMER values(CUSTOMER_ID, REPLACE(CUSTOMER_TYPE,'###','BUSINESS'), CUSTOMER_MILES, CUSTOMER_Key);
END LOOP;
CLOSE bad_cursor_customer;
END;

begin
customer_clean;
end;