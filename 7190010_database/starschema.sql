--------------------------------------------------------------
-- Database creation Script
-- Drop tables --

DROP TABLE FACT_FLIGHT_OUTCOME;

DROP TABLE DIM_CUSTOMER;

DROP TABLE DIM_TIME;

DROP TABLE DIM_AIRLINE;

DROP TABLE DIM_FLIGHTS;

DROP TABLE DIM_COMPLAINT;


-- Auto-Generated by QSEE-SuperLite (c) 2001-2004 QSEE-Technologies Ltd.

-- Verbose generation: ON

-- note: spaces within table/column names have been replaced by underscores (_)

-- Target DB: SQL2

-- Entity Model :Entity Relationship Diagram

-- To drop the tables generated by this script run -
--   'G:\level 6 database\final_drop.sql'

--------------------------------------------------------------



--------------------------------------------------------------
-- Table Creation --

-- Each entity on the model is represented by a table that needs to be created within the Database.
-- Within SQL new tables are created using the CREATE TABLE command.
-- When a table is created its name and its attributes are defined.
-- The values of which are derived from those specified on the model.
-- Certain constraints are sometimes also specified, such as identification of primary keys.


-- Create a Database table to represent the "DIM_CUSTOMER" entity.
CREATE TABLE DIM_CUSTOMER(
	customer_id	INTEGER NOT NULL,
	customer_type	VARCHAR(30),
	customer_miles	INTEGER,
	customer_key	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "DIM_CUSTOMER".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_CUSTOMER PRIMARY KEY (customer_id)
);

-- Create a Database table to represent the "DIM_TIME" entity.
CREATE TABLE DIM_TIME(
	time_id	INTEGER NOT NULL,
	time_key	INTEGER,
	year	INTEGER,
	month	INTEGER,
	day	INTEGER,
	day_of_week	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "DIM_TIME".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_TIME PRIMARY KEY (time_id)
);

-- Create a Database table to represent the "DIM_AIRLINE" entity.
CREATE TABLE DIM_AIRLINE(
	airline_id	INTEGER NOT NULL,
	col_id	INTEGER,
	air_system_delay	INTEGER,
	security_delay	INTEGER,
	airline_delay	INTEGER,
	late_aircraft_delay	INTEGER,
	weather_delay	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "DIM_AIRLINE".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_AIRLINE PRIMARY KEY (airline_id)
);

-- Create a Database table to represent the "DIM_FLIGHTS" entity.
CREATE TABLE DIM_FLIGHTS(
	flight_id	INTEGER NOT NULL,
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
	-- Specify the PRIMARY KEY constraint for table "DIM_FLIGHTS".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_FLIGHTS PRIMARY KEY (flight_id)
);

-- Create a Database table to represent the "DIM_COMPLAINT" entity.
CREATE TABLE DIM_COMPLAINT(
	complaint_ID	INTEGER NOT NULL,
	complain_type	VARCHAR(30),
	complain_description	VARCHAR(30),
	complain_status	VARCHAR(30),
	complain_compensation	VARCHAR(30),
	compensation_type	VARCHAR(30),
	complain_key	INTEGER,
	flight_id_no	INTEGER,
	-- Specify the PRIMARY KEY constraint for table "DIM_COMPLAINT".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_DIM_COMPLAINT PRIMARY KEY (complaint_ID)
);

-- Create a Database table to represent the "FACT_FLIGHT_OUTCOME" entity.
CREATE TABLE FACT_FLIGHT_OUTCOME(
	flight_outcome_id	INTEGER NOT NULL,
	total_complain	INTEGER,
	total_flights	INTEGER,
	total_delay	INTEGER,
	total_diverted	INTEGER,
	total_cancelled	INTEGER,
	total_compensation	INTEGER,
	total_flights_ontime	INTEGER,
	customer_id	INTEGER NOT NULL,
	time_id	INTEGER NOT NULL,
	airline_id	INTEGER NOT NULL,
	flight_id	INTEGER NOT NULL,
	complaint_ID	INTEGER NOT NULL,
	-- Specify the PRIMARY KEY constraint for table "FACT_FLIGHT_OUTCOME".
	-- This indicates which attribute(s) uniquely identify each row of data.
	CONSTRAINT	pk_FACT_FLIGHT_OUTCOME PRIMARY KEY (flight_outcome_id)
);


--------------------------------------------------------------
-- Alter Tables to add fk constraints --

-- Now all the tables have been created the ALTER TABLE command is used to define some additional
-- constraints.  These typically constrain values of foreign keys to be associated in some way
-- with the primary keys of related tables.  Foreign key constraints can actually be specified
-- when each table is created, but doing so can lead to dependency problems within the script
-- i.e. tables may be referenced before they have been created.  This method is therefore safer.

-- Alter table to add new constraints required to implement the "FACT_FLIGHT_OUTCOME_DIM_CUSTOMER" relationship

-- This constraint ensures that the foreign key of table "FACT_FLIGHT_OUTCOME"
-- correctly references the primary key of table "DIM_CUSTOMER"

ALTER TABLE FACT_FLIGHT_OUTCOME ADD CONSTRAINT complaint_fk FOREIGN KEY (complaint_id) REFERENCES DIM_COMPLAINT (complaint_id) ON DELETE CASCADE;
ALTER TABLE FACT_FLIGHT_OUTCOME ADD CONSTRAINT time_fk FOREIGN KEY (time_id) REFERENCES DIM_TIME (time_id) ON  DELETE CASCADE;
ALTER TABLE FACT_FLIGHT_OUTCOME ADD CONSTRAINT flights_fk FOREIGN KEY (flight_id) REFERENCES DIM_FLIGHTS (flight_id) ON  DELETE CASCADE;
ALTER TABLE FACT_FLIGHT_OUTCOME ADD CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES DIM_CUSTOMER (customer_id) ON  DELETE CASCADE;
ALTER TABLE FACT_FLIGHT_OUTCOME ADD CONSTRAINT airline_fk FOREIGN KEY (airline_id) REFERENCES DIM_AIRLINE (airline_id) ON  DELETE CASCADE;

--------------------------------------------------------------
-- End of DDL file auto-generation
--------------------------------------------------------------
