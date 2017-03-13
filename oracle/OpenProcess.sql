Select a.audsid
, c.SPID
, a.sid
, a.process
, a.serial#
, a.STATUS
,a.username
,a.osuser
,a.machine
,a.type
, a.logon_time
, a.schemaname
,a.lockwait
,a.program
,b.sql_text
,(select value from v$sesstat where  sid=a.sid and STATISTIC#=4) CURSORES_ABIERTOS,
(select value from v$sesstat where  sid=a.sid and STATISTIC#=178) parse_time_elapsed,
(select value from v$sesstat where  sid=a.sid and STATISTIC#=177) parse_cpu,
(select value from v$sesstat where  sid=a.sid and STATISTIC#=12)  CPU_USED_SESION,
ios.BLOCK_GETS, ios.CONSISTENT_GETS, ios.PHYSICAL_READS, ios.BLOCK_CHANGES, ios.CONSISTENT_CHANGES
from v$session a,
    v$sqlarea b,
    v$process c,
    V$SESS_IO ios
   where b.address(+)=a.sql_address
   and   c.ADDR (+)=a.PADDR
   and   ios.sid(+)=a.sid
  and a.osuser='DB_USERNAME_HERE'
order by c.SPID;
