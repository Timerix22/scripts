# cleans WinSxS dir
dism /Online /Cleanup-Image /RestoreHealth
dism /online /Cleanup-Image /StartComponentCleanup /ResetBase
dism /online /Cleanup-Image /SPSuperseded
dism /online /Cleanup-Image /StartComponentCleanup /AnalyzeComponentStore
# then reboot
