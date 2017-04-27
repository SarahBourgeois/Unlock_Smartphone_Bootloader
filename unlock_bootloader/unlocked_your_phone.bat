@echo off
:cautions  : installer
echo.
echo PLEASE READ THE FILE : README.txt INCLUDE IN THE PACKAGE PLEASE ! 
echo ==========================================================================
echo.
echo First, we have to install Hisuite. Please tape ENTER to install Hisuite
pause > nul
start unlock_software\hisuite.exe
echo. 
echo After, we have to install adb universal drivers. Please tape ENTER to install it
pause > nul
start unlock_software\UniversalAdbDriverSetup6.msi 
echo.
echo Done. Tape ENTER
pause > nul
cls
echo.
:connect_phone : usb debugging
echo  ====== IMPORTANT TO CONTINUE ==========
echo Please enable USB-DEBUGGING before to start 
echo To activate this : About phone > touch 7 ti/me serial number : you're now a developer
echo return to Parameter > developer option appears  
echo Click on it > activate developer options > activate USB debug
echo That's all !  
echo Branch your phone on the pc.
echo.
echo Accept the pc identifier, and it's good. USB DEBUG appears in notifications of you're cell
pause > nul
cls
TASKKILL /IM "adb.exe" /F
cls

echo Tape ENTER to continue. Your phone will reboot. It's normal.
pause > nul
unlock_software\adb.exe reboot-bootloader
echo.
cls
echo.
echo Bootloader screen appears.
echo In color (red for example) you can read locked. Tape ENTER.
pause > nul
:enter the code 
cls
echo We will enter the code you've recuperate (if it's not the case, please read "how_to_obtain_my_bootloader_code.txt include in the package"
echo. 
set /P variable=Code : 
cls
echo Your code :  %variable%
echo.
echo.
echo Enter the code again please to verify it's the right
echo.
echo.
set/p Code again=Again :
if %Again%== Y goto unlocker
if %Again%== y goto unlocker  
if not %Again%== Y goto code
if not %Again%== y goto code
:unlocker
cls
echo.
echo Tape ENTER to unlocked you're phone please
pause > nul
cls
echo Process...
echo.
unlock_software\fastboot.exe oem unlock %variable%
echo.
cls
echo Verify if it's unlocked
echo.
unlock_software\fastboot.exe oem get-bootinfo
echo.
echo Please tape ENTER to reboot you're phone
pause > nul
unlock_software\fastboot.exe reboot
echo.
cls
echo By SarahB https://github.com/SarahBourgeois
echo.
pause
