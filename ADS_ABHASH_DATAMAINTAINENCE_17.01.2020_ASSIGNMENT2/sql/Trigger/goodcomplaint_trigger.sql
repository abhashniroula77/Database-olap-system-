Create or replace trigger goodcomplaint_trigger 
before insert on good_complaint
for each row 
begin
select goodcustomer_sequence.nextval
into :new.complaint_id 
from dual;
end;
