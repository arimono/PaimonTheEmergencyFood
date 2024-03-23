cd "D:\mypath"

setlocal EnableDelayedExpansion

set num=0

for %%x in (*.*) do (

set fnam=%%~nx

set ext=%%~xx

ren "%%x" "Test Prefix + !fnam!!ext!"

set /a num+=1

)

pause