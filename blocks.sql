  SELECT bl.pid                 AS blocked_pid,
         a.usename              AS blocked_user,
         substring(ka.query,1,30)               AS current_statement_in_blocking_process,
         now() - ka.query_start AS blocking_duration,
         kl.pid                 AS blocking_pid,
         ka.usename             AS blocking_user,
         substring(a.query,1,30)                AS blocked_statement,
         now() - a.query_start  AS blocked_duration

  FROM  pg_catalog.pg_locks         bl
   JOIN pg_catalog.pg_stat_activity a  ON a.pid = bl.pid
   JOIN pg_catalog.pg_locks         kl ON kl.transactionid = bl.transactionid AND kl.pid != bl.pid
   JOIN pg_catalog.pg_stat_activity ka ON ka.pid = kl.pid
  WHERE NOT bl.GRANTED;
