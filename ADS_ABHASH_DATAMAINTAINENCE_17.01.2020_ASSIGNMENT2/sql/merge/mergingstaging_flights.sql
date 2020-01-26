MERGE INTO staging_flights stg
USING(SELECT flight_number, destination_airport, origin_airport, departure_delay, taxi_out, taxi_in, wheels_off,wheels_on,
      tail_number, scheduled_time, elapsed_time, arrival_delay, cancelled, diverted from Fly2015) sou
on(sou.flight_number = stg.flight_id)
when matched then
update set
stg.destination_airport = sou.destination_airport,
stg.origin_airport = sou.origin_airport,
stg.depature_delay=sou.departure_delay,
stg.taxi_out=sou.taxi_out,
stg.taxi_in=sou.taxi_in,
stg.wheels_off=sou.wheels_off,
stg.wheels_on=sou.wheels_on,
stg.tail_number=sou.tail_number,
stg.scheduled_time=sou.scheduled_time,
stg.elapsed_time=sou.elapsed_time,
stg.arrival_time=sou.arrival_delay,
stg.flight_cancelled=sou.cancelled,
stg.flight_diverted=sou.diverted
WHERE
stg.destination_airport = sou.destination_airport AND
stg.origin_airport = sou.origin_airport AND
stg.depature_delay=sou.departure_delay AND
stg.taxi_out=sou.taxi_out AND
stg.taxi_in=sou.taxi_in AND
stg.wheels_off=sou.wheels_off AND
stg.wheels_on=sou.wheels_on AND
stg.tail_number=sou.tail_number AND
stg.scheduled_time=sou.scheduled_time AND
stg.elapsed_time=sou.elapsed_time AND
stg.arrival_time=sou.arrival_delay AND
stg.flight_cancelled=sou.cancelled AND
stg.flight_diverted=sou.diverted
when not matched then
insert values(complaint_flights.nextval,sou.flight_number, sou.destination_airport, sou.origin_airport, sou.departure_delay, sou.taxi_out, sou.taxi_in, sou.wheels_off,
              sou.wheels_on, sou.tail_number, sou.scheduled_time, sou.elapsed_time, sou.arrival_delay, sou.cancelled, sou.diverted);
