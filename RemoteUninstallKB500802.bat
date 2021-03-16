:start
cls
@pushd %~dp0
@echo off
:top
ECHO ============================
ECHO Remote KB500802 Uninstall
ECHO ============================
ECHO ____________________________
color 0A
set /p "address=Enter IP of computer you want to check: "
ping -n 1 "%address%" | findstr /r /c:"[0-9] *ms"
if %errorlevel% == 0 (
    GOTO:one ) else (
    echo [41mUnable to find %address%. Device may be offline. Try again?[0m
    pause
    GOTO:top
    )
:one
cls
ECHO ============================
ECHO Remote KB500802 Uninstall
ECHO ============================
ECHO ____________________________
color 0A
echo What computer (name or IP) do you want to run this on?
echo %address%
ECHO Please wait... Checking system information.
ECHO ============================
ECHO OS INFO
ECHO ============================
systeminfo /s %address% | findstr /r /c:"KB5000802"
if %errorlevel% == 0 (
    GOTO:found ) else (
    GOTO:notfound
    )
:found
echo Please enter your admin username:
set /p user=
xcopy "%~dp0\Files\*.*" \\%address%\c$\Temp\RemoveKB5000802 /e /i /y
cls
ECHO ============================
ECHO Remote KB500802 Uninstall - %address%
ECHO ============================
ECHO ____________________________
echo [41mThis will take a long time. Please do not close this window until the script finishes.[0m
PSTools\psexec \\%address% -u deervalley\%user% -s PowerShell "C:\Temp\RemoveKB5000802\removeKB5000802.ps1"
@RD /S /Q "\\%address%\c$\Temp\RemoveKB5000802"
echo All done!
pause
cls
ECHO ============================
ECHO Remote KB500802 Uninstall
ECHO ============================
ECHO ____________________________
color 0A
echo KB50000802 has been successfully uninstalled on %address%.
@popd
pause
GOTO :EOF
:notfound
cls
ECHO ============================
ECHO Remote KB500802 Uninstall
ECHO ============================
ECHO ____________________________
color 0A
echo [41mHotfix KB500802 not found. Are you sure it's installed?[0m
@popd
pause
GOTO :start
:: Love, CJ Pollock
