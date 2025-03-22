@echo off
setlocal

:: Check if running with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Restarting...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Path to FileRepository
set "folder=C:\Windows\System32\DriverStore\FileRepository"

echo Deleting not need content in %folder%...

:: Delete files in FileRepository folder
rd /s /q "%folder%"

:: Recreate FileRepository folder
mkdir "%folder%"

echo Folder %folder% cleaned now.

pause
endlocal
