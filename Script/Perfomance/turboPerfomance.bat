@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
REM Отключение всех ненужных служб
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop WSearch
sc config WSearch start= disabled

REM Отключение визуальных эффектов
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

REM Включение всех возможных оптимизаций
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setactive SCHEME_CURRENT

