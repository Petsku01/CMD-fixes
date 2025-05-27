:: https://learn.microsoft.com/en-ie/answers/questions/2244791/how-to-bypass-the-edge-welcome-new-device-page

@echo off
cls

echo This script restores the Microsoft Edge first-run experience on a remote machine.
echo.

set /p machine=Enter the machine name: 

:: Validate input
if "%machine%"=="" (
    echo Error: No machine name provided.
    echo Please enter a valid machine name.
    pause
    exit /b
)

:: Test if the machine is reachable
ping -n 1 %machine% | find "TTL=" >nul
if %ERRORLEVEL% neq 0 (
    echo Error: Machine '%machine%' is not reachable. Please check the machine name or network connectivity.
    pause
    exit /b
)

:: Attempt to set the registry key to restore the first-run experience
REG ADD \\%machine%\HKLM\SOFTWARE\Policies\Microsoft\Edge /v HideFirstRunExperience /t REG_DWORD /d 0 /f
if %ERRORLEVEL% equ 0 (
    echo.
    echo Successfully restored the Microsoft Edge first-run experience on '%machine%'.
    echo You can now close and reopen Edge on the target machine to display the welcome page.
) else (
    echo Error: Failed to modify the registry on '%machine%'. Check permissions or if the machine is accessible.
)

echo.
pause
