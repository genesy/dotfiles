LCtrl & `::Send {Esc}

; CTRL ALT H - remove title bar and maximize active window
^!H::
WinGetTitle, currentWindow, A
IfWinExist %currentWindow%
{
	WinSet, Style, ^0xC00000 ; toggle title bar
	WinSet, Style, ^0x840000 ; toggle thin line border / dialog frame,
	WinGetPos,,,_w_, _h_, ahk_class Shell_TrayWnd
	WinMove, A,, 0, 0, A_ScreenWidth, A_ScreenHeight - _h_
}
return