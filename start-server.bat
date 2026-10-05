@echo off
title Professional Hybrid Minecraft Server (Local)
color 0A
echo ========================================
echo   PROFESSIONAL HYBRID SERVER STARTING
echo   Arclight / Mohist  |  Java 21
echo   Allocated: 4096M Heap
echo ========================================
echo.

REM Check if server.jar exists
if not exist "server.jar" (
    echo [ERROR] server.jar not found!
    echo Please download Arclight or Mohist jar and rename it to server.jar
    echo Download links are in README.md
    pause
    exit /b 1
)

echo Starting server with Aikar's optimized G1GC flags...
echo.

java -Xms4096M -Xmx4096M ^
-XX:+UseG1GC ^
-XX:+ParallelRefProcEnabled ^
-XX:MaxGCPauseMillis=200 ^
-XX:+UnlockExperimentalVMOptions ^
-XX:+DisableExplicitGC ^
-XX:+AlwaysPreTouch ^
-XX:G1NewSizePercent=30 ^
-XX:G1MaxNewSizePercent=40 ^
-XX:G1HeapRegionSize=8M ^
-XX:G1ReservePercent=20 ^
-XX:G1HeapWastePercent=5 ^
-XX:G1MixedGCCountTarget=4 ^
-XX:InitiatingHeapOccupancyPercent=15 ^
-XX:G1MixedGCLiveThresholdPercent=90 ^
-XX:G1RSetUpdatingPauseTimePercent=5 ^
-XX:SurvivorRatio=32 ^
-XX:+PerfDisableSharedMem ^
-XX:MaxTenuringThreshold=1 ^
-Dusing.aikars.flags=https://mcflags.emc.gs ^
-Daikars.new.flags=true ^
-jar server.jar nogui

echo.
echo Server has stopped.
pause
