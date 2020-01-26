Create or replace trigger recleancust_trigger 
before insert on reclean_customer
for each row 
begin
select recleancustomer_sequence.nextval
into :new.customer_id 
from dual;
end;