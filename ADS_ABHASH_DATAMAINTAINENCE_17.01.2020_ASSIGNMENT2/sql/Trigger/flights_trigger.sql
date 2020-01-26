Create or replace trigger flights_trigger 
before insert on staging_flights
for each row 
begin
select complaint_flights.nextval
into :new.flight_id 
from dual;
end;