create or replace procedure FLIGHTS_CLEAN
is
FLIGHT_ID good_flights.FLIGHT_ID%type;
flight_key good_flights.flight_key%type;
DESTINATION_AIRPORT good_flights.DESTINATION_AIRPORT%type;
ORIGIN_AIRPORT good_flights.ORIGIN_AIRPORT%type;

depature_delay good_flights.depature_delay%type;
taxi_in good_flights.taxi_in%type;
taxi_out good_flights.taxi_out%type;

wheels_off good_flights.wheels_off%type;
wheels_on good_flights.wheels_on%type;
tail_number good_flights.tail_number%type;
scheduled_time good_flights.scheduled_time%type;
elapsed_time good_flights.elapsed_time%type;
arrival_time good_flights.arrival_time%type;
flight_cancelled good_flights.flight_cancelled%type;
flight_diverted good_flights.flight_diverted%type;
cursor bad_cursor_flights
is
select * from BAD_FLIGHTS;
BEGIN
OPEN
bad_cursor_flights;
LOOP
FETCH
bad_cursor_flights into FLIGHT_ID,flight_id, DESTINATION_AIRPORT, ORIGIN_AIRPORT, taxi_out, taxi_in,depature_delay,wheels_off,wheels_on,tail_number,scheduled_time,elapsed_time,arrival_time,flight_cancelled,flight_diverted ;
EXIT WHEN
bad_cursor_flights%notfound;
insert into GOOD_flights values(FLIGHT_ID,flight_key,DESTINATION_AIRPORT, nvl(to_char(ORIGIN_AIRPORT),'JFK'), taxi_out, taxi_in,depature_delay,wheels_off,wheels_on,tail_number,scheduled_time,elapsed_time,arrival_time,flight_cancelled,flight_diverted );
END LOOP;
CLOSE bad_cursor_flights;
END;

begin
flights_clean;
end;