#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Make Capslock a hybrid Ctrl/Esc key
Capslock::
	keyPressed := false
	keyHook := InputHook("L1 M")
	keyHook.Start()
	keyHook.Wait()
	keyPressed := true
	Send {Ctrl Down}
	Send, % keyHook.Input
	Send {Ctrl Up}
	Return

Capslock up::
	keyHook.Stop()
	if !keyPressed
		Send {Esc}
	Return

; Set win+c to capslock
#c::Capslock