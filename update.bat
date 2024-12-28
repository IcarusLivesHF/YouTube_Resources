@echo off & setlocal enableDelayedExpansion

call :selfUpdate

echo updated

pause
exit

:selfUpdate
	set "currentVersion=1.0.1"

	set "mainPath=https://raw.githubusercontent.com/IcarusLivesHF/YouTube_Resources/refs/heads/main"
	set "remoteVersionUrl=%mainPath%/version.txt"
	set "vFile=%temp%\%~n0version.txt"
	curl -s -o "%vFile%" "%remoteVersionUrl%"
	for /f "usebackq delims=" %%i in ("%vFile%") do set "remoteVersion=%%i"
	
	if "%remoteVersion:.=%" lss "%currentVersion:.=%" (
		echo New version available. Updating...
		curl -s -o "%~nx0" "%mainPath%/update.bat"
		start /b "" "%~nx0"
		exit /b
	)
	for %%i in (currentVersion mainPath remoteVersion remoteVersionUrl vFile) do set "%%~i="
goto :eof
