#InstallKeybdHook
#SingleInstance Force

SetCapsLockState, AlwaysOff
Capslock::RCtrl
Insert::Capslock

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


#Include _alt_tilde.ahk