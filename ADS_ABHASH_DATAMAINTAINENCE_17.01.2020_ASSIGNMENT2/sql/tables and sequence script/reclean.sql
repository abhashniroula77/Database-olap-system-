Drop table reclean_customer;
Drop table reclean_complaint;
Drop table reclean_flights;
Drop table reclean_airline;
Create table reclean_customer(
customer_id	INTEGER NOT NULL,
	customer_type	VARCHAR(30),
	customer_miles	INTEGER,
	customer_key	INTEGER,
    message varchar(30),
	-- Specify the PRIMARY KEY constraint for table "ABHASH_CUSTOMER".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_reclean_customer PRIMARY KEY (customer_id)
);
Drop sequence recleancustomer_sequence;
Create sequence recleancustomer_sequence 
start with 1;
Create table reclean_complaint
(
complaint_ID	INTEGER NOT NULL,
	complain_type	VARCHAR(30),
	complain_description	VARCHAR(300),
	complain_status	VARCHAR(30),
	complain_compensation	INTEGER,
	compensation_type	VARCHAR(30),
	complain_key	INTEGER,
	complain_flight_id_no	INTEGER,
    message varchar(30),
	-- Specify the PRIMARY KEY constraint for table "ABHASH_COMPLAINT".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_reclean_COMPLAINT PRIMARY KEY (complaint_ID)
);
Drop sequence recleancomplaint_sequence;
Create sequence recleancomplaint_sequence
start with 1;
Create table reclean_flights
(flight_id	INTEGER NOT NULL,
	flight_key	INTEGER,
	destination_airport	VARCHAR(30),
	origin_airport	VARCHAR(30),
	depature_delay	INTEGER,
    wheels_off	INTEGER,
	wheels_on	INTEGER,
	taxi_out	INTEGER,
	taxi_in	INTEGER,
	
	tail_number	VARCHAR(30),
	scheduled_time	INTEGER,
	elapsed_time	INTEGER,
	arrival_time	INTEGER,
	flight_cancelled	INTEGER,
	flight_diverted	INTEGER,
    message varchar(30),
	-- Specify the PRIMARY KEY constraint for table "ABHASH_FLIGHTS".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_reclean_FLIGHTS PRIMARY KEY (flight_id)
);
Drop sequence recleancomplaint_flights;
Create sequence recleancomplaint_flights
start with 1;
Create table reclean_airline
(
    airline_id	INTEGER NOT NULL,
	col_id	INTEGER,
	air_system_delay	INTEGER,
	security_delay	INTEGER,
	airline_delay	INTEGER,
	late_aircraft_delay	INTEGER,
	weather_delay	INTEGER,
    message varchar(30),
	-- Specify the PRIMARY KEY constraint for table "ABHASH_AIRLINE".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_reclean_AIRLINE PRIMARY KEY (airline_id)
);
Drop sequence recleancomplaint_airline;
Create sequence recleancomplaint_airline
start with 1;




