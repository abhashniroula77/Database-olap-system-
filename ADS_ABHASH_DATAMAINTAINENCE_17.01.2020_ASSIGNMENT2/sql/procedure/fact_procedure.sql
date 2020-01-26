CREATE OR REPLACE PROCEDURE fact_procedure
IS
flight_outcome_id FACT_FLIGHT_OUTCOME.flight_outcome_id%TYPE;
total_complain FACT_FLIGHT_OUTCOME.total_complain%TYPE;
total_flights FACT_FLIGHT_OUTCOME.total_flights%TYPE;
complaint_id FACT_FLIGHT_OUTCOME.complaint_id%TYPE;
time_id FACT_FLIGHT_OUTCOME.time_id%TYPE;
flight_id FACT_FLIGHT_OUTCOME.flight_id%TYPE;
customer_id FACT_FLIGHT_OUTCOME.customer_id%TYPE;
airline_id FACT_FLIGHT_OUTCOME.airline_id%TYPE;

CURSOR cursor_fact IS
SELECT count(co.complaint_id) as total_complaint, count(f.flight_id) as total_flights, co.complaint_id, t.time_id, f.flight_id, cu.customer_id, a.airline_id

FROM DIM_CUSTOMER cu, DIM_COMPLAINT co, DIM_TIME t, DIM_FLIGHTS f, DIM_AIRLINE a

WHERE f.flight_id = a.airline_id AND a.airline_id=f.flight_id
GROUP BY co.complaint_id, t.time_id, f.flight_id, cu.customer_id, a.airline_id
ORDER BY f.flight_id;
BEGIN
     OPEN cursor_fact;
     LOOP
     FETCH cursor_fact INTO total_complain, total_flights, complaint_id, time_id, flight_id, customer_id, airline_id;
     EXIT WHEN cursor_fact%notfound; 
     INSERT INTO FACT_FLIGHT_OUTCOME VALUES(FACT_seq.NEXTVAL, total_complain, total_flights, complaint_id, time_id, flight_id, customer_id, airline_id);
END LOOP;
CLOSE cursor_fact;
END;

BEGIN 
fact_procedure;
END;