Create or replace trigger airline_trigger 
before insert on staging_airline
for each row 
begin
select complaint_airline.nextval
into :new.airline_id
from dual;
end;
