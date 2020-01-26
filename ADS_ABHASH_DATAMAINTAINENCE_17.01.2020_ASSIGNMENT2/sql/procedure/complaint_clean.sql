create or replace procedure COMPLAINT_CLEAN
is
complaint_id good_complaint.complaint_id%type;
Complain_type good_complaint.Complain_type%type;
Complain_description good_complaint.Complain_description%type;
Complain_status good_complaint.Complain_status%type;
Complain_compensation good_complaint.Complain_compensation%type;
compensation_type good_complaint.compensation_type%type;
Complain_key good_complaint.Complain_key%type;
complain_flight_id_no good_complaint.complain_flight_id_no%type;
cursor bad_cursor_complaint
is
select * from BAD_COMPLAINT;
BEGIN
OPEN
bad_cursor_complaint;
LOOP
FETCH
bad_cursor_complaint into complaint_id, Complain_type, Complain_description, Complain_status, Complain_compensation,compensation_type,Complain_key,complain_flight_id_no;
EXIT WHEN
bad_cursor_complaint%notfound;
insert into GOOD_complaint values(complaint_id,Complain_type, REPLACE(Complain_description,'%%%','LATE'), Complain_status, Complain_compensation,compensation_type,Complain_key,complain_flight_id_no);
END LOOP;
CLOSE bad_cursor_complaint;
END;

begin
COMPLAINT_CLEAN;
end;

