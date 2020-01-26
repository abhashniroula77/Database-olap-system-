Create or replace trigger goodcust_trigger 
before insert on good_customer
for each row 
begin
select goodcustomer_sequence.nextval
into :new.customer_id 
from dual;
end;