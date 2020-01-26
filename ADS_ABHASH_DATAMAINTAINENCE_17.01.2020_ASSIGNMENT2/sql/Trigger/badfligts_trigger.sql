Create or replace trigger badflights_trigger 
before insert on bad_flights
for each row 
begin
select badcomplaint_flights.nextval
into :new.flight_id 
from dual;
end;