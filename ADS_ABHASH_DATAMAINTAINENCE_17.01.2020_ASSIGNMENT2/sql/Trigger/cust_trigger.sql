Create or replace trigger cust_trigger 
before insert on staging_customer
for each row 
begin
select customer_sequence.nextval
into :new.customer_id 
from dual;
end;
