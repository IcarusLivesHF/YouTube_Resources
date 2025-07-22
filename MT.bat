@echo off & setlocal enableDelayedExpansion

if "%~1" neq "" goto :%~1

del /f /q "signal.txt"

set /a "wid=width=80"
set /a "hei=height=60"


mode %wid%,%hei%

("%~0" Controller >"signal.txt"  |  "%~0" Main <"signal.txt" ) & exit

:Main
	for /l %%# in () do (
		
		if defined key set "lastKey=!key!"
		set "key=" & set /p "key="
		
		echo User pressed !lastkey! - Current time: !time!

	)
exit


:Controller
	for /l %%# in () do for /f "tokens=*" %%i in ('choice /c:wasd /n') do echo=%%~i
exit
