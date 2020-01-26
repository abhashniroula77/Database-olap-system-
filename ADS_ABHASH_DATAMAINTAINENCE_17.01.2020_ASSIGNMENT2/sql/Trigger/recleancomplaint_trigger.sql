Create or replace trigger recleancomplaint_trigger 
before insert on reclean_complaint
for each row 
begin
select recleancomplaint_sequence.nextval
into :new.complaint_id 
from dual;
end;
