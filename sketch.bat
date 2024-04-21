@echo off & setlocal enableDelayedExpansion & call :init

rem Font: MxPlus IBM EGA - 5x5 (https://discord.gg/GXYTgX9eYz - thread.ID: 1226690191620575252)
set /a "hei=wid=100" & mode !wid!,!hei!









:init
(set \n=^^^
%= This creates an escaped Line Feed - DO NOT ALTER =%
)
(for /f %%a in ('echo prompt $E^| cmd') do set "\e=%%a" )
<nul set /p "=%\e%[?25l"

goto :eof
