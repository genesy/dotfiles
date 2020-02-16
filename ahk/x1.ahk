#InstallKeybdHook
#SingleInstance Force

SetCapsLockState, AlwaysOff
Capslock::RCtrl
Insert::Capslock

<^h::Left
<^j::Send {LCtrl up}{Down}
<^k::Send {LCtrl up}{Up}
<^l::Right
<^BS::Delete
<^y::Send {LCtrl up}(
<^u::Send {LCtrl up}{{}
<^i::Send {LCtrl up}{}}
<^o::Send {LCtrl up})
; LCtrl & p::Return

#Include _alt_tilde.ahk