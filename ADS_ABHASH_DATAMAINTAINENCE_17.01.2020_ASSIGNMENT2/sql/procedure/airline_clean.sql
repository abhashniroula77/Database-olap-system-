create or replace procedure AIRLINE_CLEAN
is
airline_id good_airline.airline_id%type;
col_id good_airline.col_id%type;
air_system_delay good_airline.air_system_delay%type;
security_delay good_airline.security_delay%type;
airline_delay good_airline.airline_delay%type;
late_aircraft_delay good_airline.late_aircraft_delay%type;
weather_delay good_airline.weather_delay%type;

cursor bad_cursor_airline
is
select * from BAD_AIRLINE;
BEGIN
OPEN
bad_cursor_airline;
LOOP
FETCH
bad_cursor_airline into airline_id, col_id, air_system_delay, security_delay, airline_delay,late_aircraft_delay,weather_delay ;
EXIT WHEN
bad_cursor_airline%notfound;
insert into GOOD_airline values(airline_id,col_id, air_system_delay, security_delay,REPLACE(airline_delay,'1','0'),late_aircraft_delay,weather_delay);
END LOOP;
CLOSE bad_cursor_airline;
END;

begin
airline_clean;
end;
