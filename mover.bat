setlocal EnableDelayedExpansion
cls
set vbs=%temp%\vbs.vbs
> %vbs% echo WScript.Echo DateAdd("d",-1,Date)
for /f "tokens=* delims=" %%a in ('cscript //nologo %vbs%') do (
    set newfold=%%a
)
echo Yesterday = %newfold%  
del %vbs%
for /f "tokens=1-3 delims=- " %%1 in ("%newfold%") do (
    set month=%%2
    set day=%%1
    set year=%%3
)

md 20%year%-%month%-%day%
md "Older"

set "source=%~dp0"
for /f "tokens=1" %%I in ('echo %newfold%') do set "yesterday=%%I"
for %%I in ("%source%\*") do (
    for /f %%a in ('echo %%~tI') do (
        if "%%a" == "%yesterday%" (
            echo Moving to yesterday folder.
            >NUL move /y "%%~fI" 20%year%-%month%-%day%
        ) else (
            echo Skipping....
        )
    )
)


for /f "tokens=1" %%I in ('echo %date%') do set "today=%%I"
for %%I in ("%source%\*") do (
    for /f %%a in ('echo %%~tI') do (
        if "%%a" neq "%today%" (
            echo Moving to older folder.
            >NUL move /y "%%~fI" "Older"
        ) else (
            echo Skipping...
        )
    )
)




