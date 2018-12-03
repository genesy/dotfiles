#InstallKeybdHook
#SingleInstance Force

SetCapsLockState, AlwaysOff
Capslock::RCtrl

LCtrl & h::Send {LCtrl up}{Left}
LCtrl & j::Send {LCtrl up}{Down}
LCtrl & k::Send {LCtrl up}{Up}
LCtrl & l::Send {LCtrl up}{Right}
LCtrl & BS::Send {LCtrl up}{Delete}
LCtrl & y::Send {LCtrl up}(
LCtrl & u::Send {LCtrl up}{{}
LCtrl & i::Send {LCtrl up}{}}
LCtrl & o::Send {LCtrl up})
LCtrl & p::Return

; >^<!h::Send {RCtrl up}{LWinUp}{Left up}{RCtrl down}{LWinDown}{Left down}
; >^<!l::Send {RCtrl up}{LWinUp}{Right up}{RCtrl down}{LWinDown}{Right down}
; ^!l::#^Right
; ^!h::#^Left
; ^!j::Send tes


; EnableFNKey = True

; #if !EnableFNKey
; 	SC163::LWin
; #if

; RAlt::
; 	EnableFNKey := !EnableFNKey
; return
; SC163::LWin
; LWin::RAlt
; RAlt::Return
; RAlt & F1::

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