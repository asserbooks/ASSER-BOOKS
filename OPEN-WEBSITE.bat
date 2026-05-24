@echo off
cd /d "%~dp0"

REM If server already running, just open browser
for /f %%p in (.server-port 2^>nul) do set "SPORT=%%p"
if not defined SPORT set "SPORT=3000"

powershell -Command "try { (Invoke-WebRequest -Uri 'http://127.0.0.1:%SPORT%' -UseBasicParsing -TimeoutSec 2).StatusCode } catch { exit 1 }" >nul 2>&1
if %errorlevel%==0 (
  echo  Website is already running. Opening browser...
  start "" "http://127.0.0.1:%SPORT%"
  timeout /t 3 >nul
  exit /b 0
)

REM Start server (opens browser automatically)
start "ASSER BOOKS Server" cmd /k "%~dp0START-WEBSITE.bat"
