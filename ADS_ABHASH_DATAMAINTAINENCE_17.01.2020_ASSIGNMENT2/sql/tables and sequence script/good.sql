Drop table good_customer;
Drop table good_complaint;
Drop table good_flights;
Drop table good_airline;
Create table good_customer(
customer_id	INTEGER NOT NULL,
	customer_type	VARCHAR(30),
	customer_miles	INTEGER,
	customer_key	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "ABHASH_CUSTOMER".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_good_customer PRIMARY KEY (customer_id)
);
Drop sequence goodcustomer_sequence;
Create sequence goodcustomer_sequence 
start with 1;
Create table good_complaint
(
complaint_ID	INTEGER NOT NULL,
	complain_type	VARCHAR(30),
	complain_description	VARCHAR(300),
	complain_status	VARCHAR(30),
	complain_compensation	INTEGER,
	compensation_type	VARCHAR(30),
	complain_key	INTEGER,
	complain_flight_id_no	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "ABHASH_COMPLAINT".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_good_COMPLAINT PRIMARY KEY (complaint_ID)
);
Drop sequence goodcomplaint_sequence;
Create sequence goodcomplaint_sequence
start with 1;
Create table good_flights
(flight_id	INTEGER NOT NULL,
	flight_key	INTEGER,
	destination_airport	VARCHAR(30),
	origin_airport	VARCHAR(30),
	depature_delay	INTEGER,
	taxi_out	INTEGER,
	taxi_in	INTEGER,
	wheels_off	INTEGER,
	wheels_on	INTEGER,
	tail_number	VARCHAR(30),
	scheduled_time	INTEGER,
	elapsed_time	INTEGER,
	arrival_time	INTEGER,
	flight_cancelled	INTEGER,
	flight_diverted	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "ABHASH_FLIGHTS".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_good_FLIGHTS PRIMARY KEY (flight_id)
);
Drop sequence goodcomplaint_flights;
Create sequence goodcomplaint_flights
start with 1;
Create table good_airline
(
    airline_id	INTEGER NOT NULL,
	col_id	INTEGER,
	air_system_delay	INTEGER,
	security_delay	INTEGER,
	airline_delay	INTEGER,
	late_aircraft_delay	INTEGER,
	weather_delay	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "ABHASH_AIRLINE".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_good_AIRLINE PRIMARY KEY (airline_id)
);
Drop sequence goodcomplaint_airline;
Create sequence goodcomplaint_airline
start with 1;




