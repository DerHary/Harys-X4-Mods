@echo off
setlocal

set "PROJECT_DIR=E:\Codex_Projekte\GameMods\X4"
set "TARGET_DIR=D:\Steam\steamapps\common\X4 Foundations\extensions"

echo Deploying mods to:
echo   %TARGET_DIR%
echo.

if not exist "%TARGET_DIR%" (
  echo Target directory not found:
  echo   %TARGET_DIR%
  exit /b 1
)

call :deploy_mod "hary_fill_buildstorage"
call :deploy_mod "hary_fill_tradestorage"
call :deploy_mod "hary_destiny_system"
call :deploy_mod "hary_satellite_placer_mk3"
call :deploy_mod "satellite_mk3"

echo.
echo Deployment finished.
pause
exit /b 0

:deploy_mod
set "MOD_NAME=%~1"
set "SOURCE_MOD=%PROJECT_DIR%\%MOD_NAME%"
set "TARGET_MOD=%TARGET_DIR%\%MOD_NAME%"

echo [%MOD_NAME%]

if not exist "%SOURCE_MOD%" (
  echo   Source mod not found, skipping:
  echo   %SOURCE_MOD%
  echo.
  exit /b 0
)

if exist "%TARGET_MOD%" (
  echo   Removing existing target folder...
  rmdir /s /q "%TARGET_MOD%"
)

echo   Copying mod...
xcopy "%SOURCE_MOD%" "%TARGET_MOD%\" /e /i /y >nul

if errorlevel 1 (
  echo   Copy failed.
  exit /b 1
)

echo   Done.
echo.
exit /b 0
