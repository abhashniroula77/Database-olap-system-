CREATE OR REPLACE PROCEDURE dimload_AIRLINE
IS
BEGIN
INSERT INTO dim_AIRLINE (airline_id, col_id ,air_system_delay ,security_delay ,airline_delay ,late_aircraft_delay,weather_delay)
                         
SELECT airline_id,col_id,air_system_delay,security_delay,airline_delay,late_aircraft_delay,weather_delay FROM good_AIRLINE;
END;

BEGIN
dimload_AIRLINE;
END;