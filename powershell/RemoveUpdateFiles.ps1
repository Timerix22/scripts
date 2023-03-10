# cleans WinSxS dir
Dism /Online /Cleanup-Image /RestoreHealth
DISM.exe /online /Cleanup-Image /StartComponentCleanup
DISM.exe /online /Cleanup-Image /SPSuperseded
DISM.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
# then reboot
