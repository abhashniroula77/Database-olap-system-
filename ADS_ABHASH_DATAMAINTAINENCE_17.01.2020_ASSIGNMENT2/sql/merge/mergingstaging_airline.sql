MERGE INTO staging_airline stg
USING(SELECT COL001, air_system_delay, security_delay, airline_delay, late_aircraft_delay, weather_delay from fly2016) sou
on(sou.COL001 = stg.col_id)
when matched then
update set
stg.air_system_delay = sou.air_system_delay,
stg.security_delay = sou.security_delay,
stg.airline_delay = sou.airline_delay,
stg.late_aircraft_delay = sou.late_aircraft_delay,
stg.weather_delay = sou.weather_delay
when not matched then
insert values(complaint_airline.nextval, sou.COL001, sou.air_system_delay, sou.security_delay, sou.airline_delay, sou.late_aircraft_delay, sou.weather_delay);
