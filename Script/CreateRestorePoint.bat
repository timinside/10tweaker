@echo off
setlocal

:: Check if running with administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Creating new restore point...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Preparing services for creating.
echo Preparing services...
net start vss
net start swprv

:: Set the name of the restore point
echo Creating new restore point...
set "RestorePointName=XTweaker"

:: Create the restore point using PowerShell
powershell -Command "Checkpoint-Computer -Description '%RestorePointName%' -RestorePointType 'Modify_Settings'"

pause
