Create or replace trigger badairline_trigger 
before insert on bad_airline
for each row 
begin
select badcomplaint_airline.nextval
into :new.airline_id
from dual;
end;