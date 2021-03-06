:: Script to disable and re-enable specific network adapters (Windows 10)
:: "Ethernet 2" has to be replaced with your OpenVPN adapter name
:: Fixes known PWK VPN connectivity issues - "Yellow OpenVPN Taskbar symbol"
@echo off
@color 0a
:: Start as admin
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Disable & re-enable network adapter after 10 seconds
echo ################ Disabling Ethernet2
netsh interface set interface "Ethernet 2" disable
timeout /t 10
echo ################ Re-enabling Ethernet2
netsh interface set interface "Ethernet 2" enable
echo ################ DONE
timeout /t 3
