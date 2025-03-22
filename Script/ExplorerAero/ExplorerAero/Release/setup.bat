@echo off
mode con:cols=45 lines=10
echo Please, wait...
goto :main

:main
cls
echo Current Directory: %cd%
echo Select:
echo -------------------------------
echo Mica for Explorer.exe
set /p userinput=Type: (yes\no)
if /i "%userinput%"=="yes" (
    echo Installing...
    if exist register.cmd (
        echo register.cmd found.
        powershell.exe -Command "Start-Process 'register.cmd' -Verb runAs"
    ) else (
        echo Error: register.cmd not found.
    )
) else if /i "%userinput%"=="no" (
    echo Uninstalling...
    if exist uninstall.cmd (
        echo uninstall.cmd found.
        powershell.exe -Command "Start-Process 'uninstall.cmd' -Verb runAs"
    ) else (
        echo Error: uninstall.cmd not found.
    )
) else (
    echo Please. Make sure you are typing what you need.
)
goto :main

exit
