CREATE OR REPLACE PROCEDURE dimload_flight
IS
BEGIN
INSERT INTO dim_FLIGHTS (flight_key,flight_id,destination_airport,origin_airport,depature_delay,taxi_out,taxi_in,wheels_off,wheels_on,tail_number,scheduled_time,elapsed_time,
                         arrival_time,flight_cancelled,flight_diverted)
                         
SELECT  flight_key,flight_id,destination_airport,origin_airport,depature_delay,taxi_out,taxi_in,wheels_off,wheels_on,tail_number,scheduled_time,elapsed_time,
        arrival_time,flight_cancelled,flight_diverted FROM good_flights;
END;

BEGIN 
dimload_flight;
END;