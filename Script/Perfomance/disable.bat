@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

REM Включение служб
sc config DiagTrack start= manual
sc start DiagTrack
sc config dmwappushservice start= manual
sc start dmwappushservice
sc config WSearch start= manual
sc start WSearch

REM Включение визуальных эффектов
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f