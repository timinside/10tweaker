@echo off
winget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Windows Package Manager not found. Please, install it on XTweaker. 
    exit /b
)
echo Windows Package Manager found. Trying to run...
timeout /t 2 >nul
cls
winget upgrade --all
echo.
echo.
echo All programs updated. Operation has been success.
echo Press any key to exit.
pause >nul
