merge into staging_customer customerstaging
using(select customer_id,customer_type,customer_miles from customer) source
on(source.customer_id=customerstaging.customer_key)
when matched then 
update set
customerstaging.customer_type=source.customer_type,
customerstaging.customer_miles=source.customer_miles
when not matched then
insert values (customer_sequence.nextval,source.customer_type,source.customer_miles,source.customer_id);
