@echo off
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
chkdsk /f /r
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log > "%userprofile%\Desktop\sfcdetails.txt"
