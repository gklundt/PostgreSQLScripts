select waiting
, state
, count(*) as total
from pg_stat_activity
group by waiting, state;
