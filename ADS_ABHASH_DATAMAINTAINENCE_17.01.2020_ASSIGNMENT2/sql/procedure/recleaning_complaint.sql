create or replace procedure recleaning_complaint
is
complaint_id good_complaint.complaint_id%type;
Complain_type good_complaint.Complain_type%type;
	Complain_description good_complaint.Complain_description%type;
	Complain_status good_complaint.Complain_status%type;
	Complain_compensation good_complaint.Complain_compensation%type;
	compensation_type good_complaint.compensation_type%type;
	Complain_key good_complaint.Complain_key%type;
	complain_flight_id_no good_complaint.complain_flight_id_no%type;
cursor recleaning_cursor_complaint
is
select complaint_id,
	Complain_type,
	Complain_description,
	Complain_status,
	Complain_compensation,
	compensation_type,
	Complain_key,
	complain_flight_id_no from good_complaint;
BEGIN
OPEN
recleaning_cursor_complaint;
LOOP
FETCH
recleaning_cursor_complaint into complaint_id,
	Complain_type,
	Complain_description,
	Complain_status,
	Complain_compensation,
	compensation_type,
	Complain_key,
	complain_flight_id_no;
EXIT WHEN
recleaning_cursor_complaint%notfound;
insert into reclean_complaint values(recleancomplaint_sequence.nextval, Complain_type,
	Complain_description,
	Complain_status,
	Complain_compensation,
	compensation_type,
	Complain_key,
	complain_flight_id_no,                                 '-');
update reclean_complaint set message = 'Data has been changed' where COMPLAIN_FLIGHT_ID_NO = 291 OR COMPLAIN_FLIGHT_ID_NO = 199 OR COMPLAIN_FLIGHT_ID_NO = 2314;
END LOOP;
CLOSE recleaning_cursor_complaint;
END;

BEGIN
recleaning_complaint;
END;