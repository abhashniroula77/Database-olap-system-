create or replace procedure recleaning_airline
is
airline_id good_airline.airline_id%type;
col_id good_airline.col_id%type;
	air_system_delay good_airline.air_system_delay%type;
	security_delay good_airline.security_delay%type;
	airline_delay good_airline.airline_delay%type;
	late_aircraft_delay good_airline.late_aircraft_delay%type;
	weather_delay good_airline.weather_delay%type;
	
cursor recleaning_cursor_airline
is
select airline_id,
	col_id,
	air_system_delay,
	security_delay,
	airline_delay,
	late_aircraft_delay,
	weather_delay
    from good_airline;
BEGIN
OPEN
recleaning_cursor_airline;
LOOP
FETCH
recleaning_cursor_airline into airline_id,
	col_id,
	air_system_delay,
	security_delay,
	airline_delay,
	late_aircraft_delay,
	weather_delay;
EXIT WHEN
recleaning_cursor_airline%notfound;
insert into reclean_airline values(recleancomplaint_airline.nextval, 
                                   col_id,
	air_system_delay,
	security_delay,
	airline_delay,
	late_aircraft_delay,
	weather_delay,
                                     '-');
update reclean_airline set message = 'Data has been changed';
END LOOP;
CLOSE recleaning_cursor_airline;
END;

BEGIN
recleaning_airline;
END;