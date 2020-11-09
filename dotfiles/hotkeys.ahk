#NoEnv
#Warn

SendMode Input
; Ensures a consistent starting directory.
SetWorkingDir %A_ScriptDir%

DetectHiddenWindows, On
SetTitleMatchMode, 2

; Macro Key List
;   M1 - (left control + left alt + [) - ^![
;   M2 - (left control + left alt + ]) - ^!]
;   M3 - (left control + left alt + ;) - ^!;
;   M4 - (left control + left alt + ') - ^!'
;   M5 - (left control + left alt + .) - ^!.
;   M6 - (left control + left alt + /) - ^!/


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


centerToggle := 0
leftToggle := 0
rightToggle := 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Reset Toggle Variables
resetToggleVariables ()
{
	global centerToggle
	global leftToggle
	global rightToggle

	centerToggle := 0
	leftToggle := 0
	rightToggle := 0
}


; Center and resize
centerAndResizeToggle()
{
	global centerToggle
	if (centerToggle = 0)
	{
		centerToggle := 1
		windowWidth := A_ScreenWidth-200
		windowHeight := A_ScreenHeight-200

	}
	else if (centerToggle = 1)
	{
		centerToggle := 2
		windowWidth := 1920
		windowHeight := A_ScreenHeight-200
	}
	else
	{
		centerToggle := 0
		windowWidth := 1920
		windowHeight := 1080
	}
	WinGetActiveTitle, Title
	WinMove, %Title%,, (A_ScreenWidth/2)-(windowWidth/2), (A_ScreenHeight/2)-(windowHeight/2), windowWidth, windowHeight
}


; Resize and reposition
resizeAndReposition(x, y, width, height)
{
	WinGetActiveTitle, Title
	WinMove, %Title%,, x, y, width, height
}


; Right Toggle
rightToggle()
{
	global rightToggle
	if (rightToggle = 0)
	{
		rightToggle = 1
		resizeAndReposition(((A_ScreenWidth/2)+150), 100, ((A_ScreenWidth/2)-250), A_ScreenHeight-200)
	}
	else
	{
		rightToggle = 0
		resizeAndReposition(((A_ScreenWidth/2)+370), 100, ((A_ScreenWidth/2)-470), A_ScreenHeight-200)

	}
}


; Left Toggle
leftToggle()
{
	global leftToggle
	if (leftToggle = 0)
	{
		leftToggle = 1
		resizeAndReposition(100, 100, 1920, A_ScreenHeight-200)
	}
	else
	{
		leftToggle = 0
		resizeAndReposition(100, 100, 2200, A_ScreenHeight-200)
	}
}


; Application Toggler
appToggler(name, path, x, y, width, height)
{
	SetTitleMatchMode, 2
	ifWinNotExist, %name%
	{
		Run, %path%
		WinWait, %name%
		WinMove, %name%,, %x%, %y%, %width%, %height%
	}
	ifWinActive, %name%
	{
		WinMinimize
	}
	Else
	{
		ifWinNotActive, %name%
		{
			WinActivate
			WinMove, %name%,, %x%, %y%, %width%, %height%
		}
	}
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Macro Buttons
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Macro 1 - Firefox
^![::appToggler("Mozilla Firefox", "C:\Program Files\Mozilla Firefox\firefox.exe", 100, 100, 1920, A_ScreenHeight-200)


; Macro 2 - Outlook
^!]::appToggler("ian.rogren", "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE", ((A_ScreenWidth/2)+150), 100, ((A_ScreenWidth/2)-250), (A_ScreenHeight/2))


; Macro 3 - Spotify
^!;::appToggler("Spotify", "C:\Users\Ian\AppData\Local\Microsoft\WindowsApps\Spotify.exe", ((A_ScreenWidth/2)+150), 100, ((A_ScreenWidth/2)-250), (A_ScreenHeight/2))


; Macro 4 - Teams
^!'::appToggler(" | Microsoft Teams", "C:\Users\Ian\AppData\Local\Microsoft\Teams\Update.exe --processStart 'Teams.exe'", ((A_ScreenWidth/2)+150), (A_ScreenHeight/2)+150, ((A_ScreenWidth/2)-250), (A_ScreenHeight/2)-250)


; Macro 5 - Termianl (quarter screen)
^!.::appToggler("~", "C:\Users\Ian\AppData\Local\Microsoft\WindowsApps\wt.exe", ((A_ScreenWidth/2)+150), (A_ScreenHeight/2)+150, ((A_ScreenWidth/2)-250), (A_ScreenHeight/2)-250)


; Macro 6
; ^!/::


; Macro 7
; ^!\::


; Macro 8 - Toggle Center
^!,::centerAndResizeToggle()


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Arrow Keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Up Arrow
!Up::resizeAndReposition(((A_ScreenWidth/2)+150), 100, ((A_ScreenWidth/2)-250), (A_ScreenHeight/2))


; Down Arrow
!Down::resizeAndReposition(((A_ScreenWidth/2)+150), (A_ScreenHeight/2)+150, ((A_ScreenWidth/2)-250), (A_ScreenHeight/2)-250)


; Left Arrow
!Left::leftToggle()


; Right Arrow
!Right::rightToggle()


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other Keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Window always on top.
!^space::Winset, Alwaysontop, , A


; Reload
^#!r::Reload

; Pause
^#!p::Pause

; Exit
^#!x::ExitApp
