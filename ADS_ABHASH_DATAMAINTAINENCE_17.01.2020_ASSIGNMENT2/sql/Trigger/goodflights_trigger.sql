Create or replace trigger goodflights_trigger 
before insert on good_flights
for each row 
begin
select goodcomplaint_flights.nextval
into :new.flight_id 
from dual;
end;