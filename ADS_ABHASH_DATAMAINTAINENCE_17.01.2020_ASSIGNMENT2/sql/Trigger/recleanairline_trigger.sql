Create or replace trigger recleanairline_trigger 
before insert on reclean_airline
for each row 
begin
select recleancomplaint_airline.nextval
into :new.airline_id
from dual;
end;