@echo off
title ASSER BOOKS Website Server
cd /d "%~dp0"
color 0A

echo.
echo  ==========================================
echo    ASSER BOOKS - Starting Website
echo  ==========================================
echo.

REM --- Find Node.js (try multiple locations) ---
set "NODE_EXE="

where node >nul 2>&1
if %errorlevel%==0 (
  for /f "delims=" %%i in ('where node 2^>nul ^| findstr /i "node.exe"') do (
    set "NODE_EXE=%%i"
    goto :run
  )
)

if exist "%ProgramFiles%\nodejs\node.exe" (
  set "NODE_EXE=%ProgramFiles%\nodejs\node.exe"
  goto :run
)

if exist "%LOCALAPPDATA%\Programs\node\node.exe" (
  set "NODE_EXE=%LOCALAPPDATA%\Programs\node\node.exe"
  goto :run
)

if exist "%LOCALAPPDATA%\Programs\cursor\resources\app\resources\helpers\node.exe" (
  set "NODE_EXE=%LOCALAPPDATA%\Programs\cursor\resources\app\resources\helpers\node.exe"
  goto :run
)

echo  ERROR: Node.js was not found on your computer.
echo.
echo  Please install Node.js from: https://nodejs.org/
echo  Then double-click this file again.
echo.
pause
exit /b 1

:run
echo  Using Node: %NODE_EXE%
echo.
echo  Starting server... browser will open automatically.
echo  DO NOT CLOSE this window while using the website.
echo.

"%NODE_EXE%" server\index.js

echo.
echo  Server stopped.
pause
exit /b 0
