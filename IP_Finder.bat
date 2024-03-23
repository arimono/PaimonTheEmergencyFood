@ECHO ON

FOR /L %%i IN (1,1,254) DO (
  PING -n 1 192.168.0.%%i | FIND /i "time" >> d:\ipaddresses.txt
)

ECHO Ping sweep completed. Reachable IPs are saved in d:\ipaddresses.txt

PAUSE
