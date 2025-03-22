@echo off
:: Получить путь к папке со скриптом
set "scriptPath=%~dp0"
:: Установить путь к изображению
set "imagePath=%scriptPath%cosmic.png"
:: Изменить параметры реестра для установки фона рабочего стола
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imagePath%" /f
:: Обновить параметры пользователя
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True