@echo off
echo ====================================================
echo Wellness Management System - Update Script
echo ====================================================
echo.

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with Administrator privileges - OK
) else (
    echo Error: Please run this script as Administrator
    echo Right-click on the script and select "Run as administrator"
    pause
    exit /b 1
)

:: Git pull for latest changes
echo Checking for updates...
git pull
if %errorLevel% neq 0 (
    echo Error: Unable to fetch updates
    pause
    exit /b 1
)

:: Stop running servers
echo.
echo Stopping any running servers...
taskkill /F /IM "java.exe" /FI "WINDOWTITLE eq Backend Server" >nul 2>&1
taskkill /F /IM "node.exe" /FI "WINDOWTITLE eq Frontend Server" >nul 2>&1

:: Update backend
echo.
echo Updating backend...
cd backend
call mvn clean install
if %errorLevel% neq 0 (
    echo Error: Backend update failed
    pause
    exit /b 1
)

:: Update frontend
echo.
echo Updating frontend...
cd ..\frontend
call npm install
if %errorLevel% neq 0 (
    echo Error: Frontend update failed
    pause
    exit /b 1
)

:: Return to root directory
cd ..

echo.
echo ====================================================
echo Update completed successfully!
echo ====================================================
echo.
echo To start the application:
echo 1. Double-click 'start.bat' in the project root directory
echo 2. The application will open in your default browser
echo.
echo Backend will run on: http://localhost:8080/api
echo Frontend will run on: http://localhost:3000
echo H2 Console will be available at: http://localhost:8080/api/h2-console
echo.

pause