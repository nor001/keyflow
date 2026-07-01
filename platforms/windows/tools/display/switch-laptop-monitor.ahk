val := ""
try val := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")

if val = "1" ; light
{
  val := "0" ; dark
  scale := 175
}
else
{
  val := "1"
  scale := 125
}

Run "..\..\..\..\app_exe\SetDpi.exe " scale
Run "main.cpl"
WinWaitActive("Mouse")
Send "{Space}{Enter}"

; RegWrite val, "REG_DWORD", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme"
; RegWrite val, "REG_DWORD", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "SystemUsesLightTheme"
; Run "..\app_sap\mini sap- switch theme.ahk"

Send "^+!a" ; FancyZones refresh after DPI change
ExitApp
