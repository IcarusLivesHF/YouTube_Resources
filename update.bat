@echo off & setlocal enableDelayedExpansion

if "%~1" neq "1" call :selfUpdate

echo updated 
pause
exit

:selfUpdate
	set "currentVersion=1.0.0"

	set "mainPath=https://raw.githubusercontent.com/IcarusLivesHF/YouTube_Resources/refs/heads/main"
	set "remoteVersionUrl=%mainPath%/version.txt"
	set "vFile=%temp%\%~n0version.txt"
	curl -s -o "%vFile%" "%remoteVersionUrl%"
	for /f "delims=" %%i in ("%vFile%") do set "remoteVersion=%%i"

	if "%remoteVersion%" neq "%currentVersion%" (
		echo New version available. Updating...
		curl -s -o "%~nx0" "%mainPath%/update.bat"
		start "" "%~nx0" 1
		exit /b
	)
	for %%i in (currentVersion mainPath remoteVersion remoteVersionUrl vFile) do set "%%~i="
goto :eof
