@echo off & setlocal enableDelayedExpansion

call :selfUpdate

echo updated

pause
exit

:selfUpdate
	set "currentVersion=1.0.0"

	set "remoteVersionUrl=https://github.com/IcarusLivesHF/YouTube_Resources/blob/main/version.txt"
	set "vFile=%temp%\%~n0version.txt"
	curl -s -o "%vFile%" "%remoteVersionUrl%"
	for /f "delims=" %%i in ("%vFile%") do set "remoteVersion=%%i"

	if "%remoteVersion%" neq "%currentVersion%" (
		echo New version available. Updating...
		curl -s -o "%~nx0" "http://example.com/newscript.bat"
		start "" "%~nx0"
		exit /b
	)
goto :eof
