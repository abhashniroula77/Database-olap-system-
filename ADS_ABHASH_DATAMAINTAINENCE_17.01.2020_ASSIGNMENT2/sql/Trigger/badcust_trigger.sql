Create or replace trigger badcust_trigger 
before insert on bad_customer
for each row 
begin
select badcustomer_sequence.nextval
into :new.customer_id 
from dual;
end;