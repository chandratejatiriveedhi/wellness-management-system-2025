@echo off
echo Starting Wellness Management System Setup...
echo.

:: Check Java
echo Checking Java...
java -version >nul 2>&1
if %errorLevel% neq 0 (
    echo Java is not installed. Please install Java 17 from https://adoptium.net/
    pause
    exit /b 1
)

:: Check Node.js
echo Checking Node.js...
node -v >nul 2>&1
if %errorLevel% neq 0 (
    echo Node.js is not installed. Please install from https://nodejs.org/
    pause
    exit /b 1
)

:: Create directories if they don't exist
if not exist "frontend" mkdir frontend
if not exist "backend" mkdir backend

:: Setup Backend
echo Setting up backend...
cd backend
call mvn clean install
if %errorLevel% neq 0 (
    echo Maven build failed
    pause
    exit /b 1
)

:: Setup Frontend
echo Setting up frontend...
cd ..\frontend
call npm install
if %errorLevel% neq 0 (
    echo NPM install failed
    pause
    exit /b 1
)

:: Create start script
cd ..
echo @echo off > run.bat
echo echo Starting Backend... >> run.bat
echo cd backend >> run.bat
echo start mvn spring-boot:run >> run.bat
echo echo Waiting for backend to start... >> run.bat
echo timeout /t 30 >> run.bat
echo echo Starting Frontend... >> run.bat
echo cd ..\frontend >> run.bat
echo start npm start >> run.bat

echo.
echo Setup complete!
echo To start the application, run 'run.bat'
echo.
pause