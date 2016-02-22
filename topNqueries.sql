with n as (
select calls
, rows
, (blk_read_time/1000)/ calls as avg_time_per_call
, query 
from pg_stat_statements) 
select * 
from n 
where avg_time_per_call >= 1 
order by 3 desc;
