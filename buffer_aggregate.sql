select count(*),isdirty 
  from pg_buffercache 
  group by isdirty,usagecount 
  order by isdirty,usagecount;
 
