@echo off
title Hybrid Server + ngrok Public Tunnel
color 0B
echo ========================================
echo   PUBLIC HYBRID SERVER LAUNCHER
echo   Starts Minecraft + ngrok TCP tunnel
echo ========================================
echo.

REM Check for ngrok
where ngrok >nul 2>nul
if %errorlevel% neq 0 (
    echo [WARNING] ngrok not found in PATH!
    echo Download ngrok from https://ngrok.com/download
    echo Extract ngrok.exe and place it in this folder or add to PATH.
    echo.
    echo Continuing without auto-start of ngrok...
    echo You can start ngrok manually: ngrok tcp 25565
    echo.
    goto :start_server
)

echo Starting ngrok TCP tunnel on port 25565 in a new window...
start "ngrok TCP Tunnel" cmd /k "ngrok tcp 25565"

timeout /t 3 /nobreak >nul

:start_server
echo.
echo Starting Minecraft Hybrid Server...
echo.

call start-server.bat

echo.
echo Both processes ended.
pause
