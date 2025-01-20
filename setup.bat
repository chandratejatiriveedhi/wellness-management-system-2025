@echo off
echo ====================================================
echo Wellness Management System - Setup Script
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

echo Checking prerequisites...
echo.

:: Check Java Installation
echo Checking Java installation...
java -version >nul 2>&1
if %errorLevel% == 0 (
    echo Java is installed - OK
) else (
    echo Error: Java is not installed
    echo Please install Java 17 from https://adoptium.net/
    start https://adoptium.net/
    pause
    exit /b 1
)

:: Check Java Version
java -version 2>&1 | findstr /i "version" > temp.txt
set /p JAVA_VERSION=<temp.txt
del temp.txt
echo Detected Java %JAVA_VERSION%

:: Check Maven Installation
echo Checking Maven installation...
mvn -v >nul 2>&1
if %errorLevel% == 0 (
    echo Maven is installed - OK
) else (
    echo Error: Maven is not installed
    echo Please install Maven from https://maven.apache.org/download.cgi
    start https://maven.apache.org/download.cgi
    pause
    exit /b 1
)

:: Check Node.js Installation
echo Checking Node.js installation...
node -v >nul 2>&1
if %errorLevel% == 0 (
    echo Node.js is installed - OK
) else (
    echo Error: Node.js is not installed
    echo Please install Node.js from https://nodejs.org/
    start https://nodejs.org/
    pause
    exit /b 1
)

echo.
echo All prerequisites are satisfied!
echo.

:: Ask user if they want to proceed with setup
set /p CONTINUE="Do you want to proceed with the setup? (Y/N): "
if /i "%CONTINUE%" neq "Y" exit /b 0

echo.
echo Starting setup process...
echo.

:: Create data directory for H2 database
if not exist "backend\data" (
    echo Creating data directory for H2 database...
    mkdir "backend\data"
)

:: Build Backend
echo.
echo Building backend...
cd backend
call mvn clean install
if %errorLevel% neq 0 (
    echo Error: Backend build failed
    pause
    exit /b 1
)

:: Install Frontend Dependencies
echo.
echo Installing frontend dependencies...
cd ..\frontend
call npm install
if %errorLevel% neq 0 (
    echo Error: Frontend dependency installation failed
    pause
    exit /b 1
)

:: Create start script
cd ..
echo @echo off > start.bat
echo echo Starting Wellness Management System... >> start.bat
echo echo. >> start.bat
echo start "Backend Server" cmd /c "cd backend ^& mvn spring-boot:run" >> start.bat
echo timeout /t 10 >> start.bat
echo start "Frontend Server" cmd /c "cd frontend ^& npm start" >> start.bat
echo start http://localhost:3000 >> start.bat

echo.
echo ====================================================
echo Setup completed successfully!
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
echo Database Credentials:
echo JDBC URL: jdbc:h2:file:./data/wellness_db
echo Username: sa
echo Password: password
echo.

pause