Create or replace trigger goodairline_trigger 
before insert on good_airline
for each row 
begin
select goodcomplaint_airline.nextval
into :new.airline_id
from dual;
end;