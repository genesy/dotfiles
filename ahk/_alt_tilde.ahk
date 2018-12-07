
!`::	; Next Window
WinGet, CurrentActive, ProcessName, A
WinGet, Instances, Count, ahk_exe %CurrentActive%
If Instances > 1
	WinSet, Bottom,, A
	WinActivate, ahk_exe %CurrentActive%
return


!#`::	; Previous Window
WinGet, CurrentActive, ProcessName, A
WinGet, Instances, Count, ahk_exe %CurrentActive%
If Instances > 1
	WinActivateBottom, ahk_exe %CurrentActive%
return