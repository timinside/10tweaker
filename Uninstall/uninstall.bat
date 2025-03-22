@echo off
net session >nul 2>&1
if errorlevel 1 (
    echo XTweaker is uninstalling proccess inizialisation...
    powershell -Command "Start-Process '%~s0' -Verb RunAs"
    exit
)
@title XTweaker is uninstalling...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{74392878-CE70-4BDB-853F-55C4131EC5E9}_is1" /f
