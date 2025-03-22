@echo off
setlocal

:: Get the directory of the current script
set "scriptDir=%~dp0"

:: Path to the PowerShell script in the same directory
set "psScriptPath=%scriptDir%MSStoreRemove.ps1"

:: Run the PowerShell script
powershell -ExecutionPolicy Bypass -File "%psScriptPath%"

endlocal
