Create or replace trigger complaint_trigger 
before insert on staging_complaint
for each row 
begin
select complaint_sequence.nextval
into :new.complaint_id 
from dual;
end;