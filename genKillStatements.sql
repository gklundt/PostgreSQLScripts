SELECT concat('SELECT pg_cancel_backend(',pid,')  #'  ) AS sql
, state 
,  age(query_start, now() ) as runningtime  
FROM pg_stat_activity  
WHERE state = 'idle' ORDER BY runningtime ASC ;
