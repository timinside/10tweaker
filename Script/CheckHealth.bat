@echo off
@chcp 65001 >nul
@title XTweaker Check PC Settings [PRE-RELEASE]
echo =====================================
echo       XTweaker Check PC Settings
echo =====================================
echo.
echo Проверка и оптимизация производительности... Логи вы можете видеть ниже.
echo.
echo Очистка временных файлов...
del /q /s /f %temp%\*
rd /s /q %temp%
echo.
echo Проверка и устранение проблем с диском...
chkdsk /f
echo.
echo Оптимизация файловой системы...
defrag C: /U /V
echo.
echo Отключение визуальных эффектов...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
echo.
echo Отключение ненужных служб...
sc config "SysMain" start= disabled
sc config "WSearch" start= disabled
echo.
echo Отключение OneDrive из автозагрузки...
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /t REG_SZ /d "" /f
echo.
echo Настройка плана электропитания на "Высокую производительность"...
powercfg -setactive SCHEME_MIN
echo.
echo Внесение изменений в реестр для улучшения производительности...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "BootDriverFlags" /t REG_DWORD /d 1c /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "CurrentUser" /t REG_SZ /d "USERNAME" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "EarlyStartServices" /t REG_MULTI_SZ /d "RpcSs\0Power\0BrokerInfrastructure\0SystemEventsBroker\0DcomLaunch\0RpcEpMapper\0LSM\0AppIdSvc\0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "PreshutdownOrder" /t REG_MULTI_SZ /d "DeviceInstall\0UsoSvc\0gpsvc\0trustedinstaller\0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d 04000000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "5000" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SystemStartOptions" /t REG_SZ /d "MAXMEM=8589934592 NOEXECUTE=OPTIN NUMPROC=4 USEPLATFORMCLOCK" /f