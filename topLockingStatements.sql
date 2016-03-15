with pids as (
select pid, count(*) as locks
from pg_locks
group by pid
order by count(*) desc
limit 10)
select p.*
, a.usename
, application_name
, client_addr
, client_hostname
, now()-query_start as duration
, waiting
, state
, substring(query,1,45) as q_start
from pids p
join pg_stat_activity a on p.pid = a.pid;
