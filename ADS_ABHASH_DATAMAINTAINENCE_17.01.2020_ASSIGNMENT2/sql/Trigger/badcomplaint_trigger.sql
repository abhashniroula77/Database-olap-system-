Create or replace trigger badcomplaint_trigger 
before insert on bad_complaint
for each row 
begin
select badcustomer_sequence.nextval
into :new.complaint_id 
from dual;
end