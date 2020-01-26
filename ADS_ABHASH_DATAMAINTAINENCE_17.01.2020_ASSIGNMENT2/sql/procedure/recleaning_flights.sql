create or replace procedure recleaning_flights
is
Flight_id good_flights.flight_id%type;
destination_airport good_flights.destination_airport%type;
	origin_airport good_flights.origin_airport%type;
	TAXI_IN good_flights.TAXI_IN%type;
	TAXI_OUT good_flights.TAXI_OUT%type;
	FLIGHT_key good_flights.FLIGHT_key%type;
	DEPATURE_DELAY good_flights.DEPATURE_DELAY%type;
	WHEELS_OFF good_flights.WHEELS_OFF%type;
    WHEELS_ON good_flights.WHEELS_ON%type;
    TAIL_NUMBER good_flights.TAIL_NUMBER%type;
    SCHEDULED_TIME good_flights.SCHEDULED_TIME%type;
    ELAPSED_TIME good_flights.ELAPSED_TIME%type;
    ARRIVAL_time good_flights.ARRIVAL_time%type;
    FLIGHT_CANCELLED good_flights.FLIGHT_CANCELLED%type;
    FLIGHT_DIVERTED good_flights.FLIGHT_DIVERTED%type;
cursor recleaning_cursor_flights
is
select flight_id,
	destination_airport,
	origin_airport,
	TAXI_IN,
	TAXI_OUT,
	FLIGHT_key,
	DEPATURE_DELAY,
	WHEELS_OFF,
    WHEELS_ON,
    TAIL_NUMBER,
    SCHEDULED_TIME,
    ELAPSED_TIME,
    ARRIVAL_time,
    FLIGHT_CANCELLED,
    FLIGHT_DIVERTED
    from good_flights;
BEGIN
OPEN
recleaning_cursor_flights;
LOOP
FETCH
recleaning_cursor_flights into flight_id,
	destination_airport,
	origin_airport,
	TAXI_IN,
	TAXI_OUT,
	FLIGHT_key,
	DEPATURE_DELAY,
	WHEELS_OFF,
    WHEELS_ON,
    TAIL_NUMBER,
    SCHEDULED_TIME,
    ELAPSED_TIME,
    ARRIVAL_time,
    FLIGHT_CANCELLED,
    FLIGHT_DIVERTED;
EXIT WHEN
recleaning_cursor_flights%notfound;
insert into reclean_flights values(recleancomplaint_flights.nextval,FLIGHT_key,
    destination_airport,
	origin_airport,
	TAXI_IN,
	TAXI_OUT,
	DEPATURE_DELAY,
	WHEELS_OFF,
    WHEELS_ON,
    TAIL_NUMBER,
    SCHEDULED_TIME,
    ELAPSED_TIME,
    ARRIVAL_time,
    FLIGHT_CANCELLED,
    FLIGHT_DIVERTED,
                                     '-');
update reclean_flights set message = 'Data has been changed' where FLIGHT_ID = 10 OR FLIGHT_ID = 11 OR FLIGHT_ID = 12;
END LOOP;
CLOSE recleaning_cursor_flights;
END;

BEGIN
recleaning_flights;
END;