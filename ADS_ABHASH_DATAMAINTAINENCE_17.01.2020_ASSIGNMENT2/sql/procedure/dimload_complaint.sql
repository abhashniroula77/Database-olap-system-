CREATE OR REPLACE PROCEDURE dimload_COMPLAINT
IS
BEGIN
INSERT INTO dim_COMPLAINT (complaint_id, complain_type, complain_description, complain_status, complain_compensation, compensation_type, complain_key, complain_flight_id_no)
SELECT complaint_id, complain_type, complain_description, complain_status, complain_compensation, compensation_type, complain_key, complain_flight_id_no FROM good_complaint;
END;

BEGIN 
load_COMPLAINT;
END;