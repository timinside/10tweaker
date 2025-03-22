@Echo off
Title Mica Start [BY GOBOBDEV]
mode con:cols=45 lines=10
:me
echo Select:
echo -------------------------------
echo Супер прозрачность
echo 1. Вкл
echo 2. Выкл
set /p var=Ввод:
if %var%==1 goto 1
if %var%==2 goto 2
:1
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAcrylicOpacity /t REG_DWORD /reg:32 /d 0 /f
reg add HKCU\SOFTWARE\TranslucentSM /f
reg add HKCU\SOFTWARE\TranslucentSM /v TintLuminosityOpacity /t REG_DWORD /reg:32 /d 2 /f
reg add HKCU\SOFTWARE\TranslucentSM /v TintOpacity /t REG_DWORD /reg:32 /d 1 /f
copy "start.exe" "%userprofile%\AppData"
copy "yar.lnk" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
taskkill /F /IM explorer.exe
start explorer.exe
cls&goto me
:2
del /q /f /s "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\yar.lnk"
del /q /f /s "%userprofile%\AppData\start.exe"
reg delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAcrylicOpacity /f
reg delete HKCU\SOFTWARE\TranslucentSM /f
taskkill /F /IM explorer.exe
start explorer.exe
cls&goto me