@Echo off
Title Clean center [BY GOBOBDEV]
mode con:cols=45 lines=10
cls&goto me

:me
echo Select:
echo -------------------------------
echo Авто-очистка
echo 1. Вкл
echo 2. Выкл
set /p var=Ввод:
if %var%==1 goto 1
if %var%==2 goto 2

:1
echo.>"%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Clean.cmd"
set "label=:t"
<"%~f0">"%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Clean.cmd" (for /f "delims=:" %%i in ('more^| findstr/bilnc:"%label%"') do more +%%i)
cls&goto me

:t
Title Clean up... [BY GOBOBDEV]
cd %userprofile%\AppData\Local\Temp\
rd /q /s %userprofile%\AppData\Local\Temp\
del /q /f /s %userprofile%\AppData\Local\Temp\*.*
cd %windir%\Temp\
del /q /f /s %windir%\Temp\*.*
rd /q /s %windir%\Temp\
cls&exit

:2
del /q /f /s "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.cmd"
cls&goto me