Create or replace trigger recleanflights_trigger 
before insert on reclean_flights
for each row 
begin
select recleancomplaint_flights.nextval
into :new.flight_id 
from dual;
end;