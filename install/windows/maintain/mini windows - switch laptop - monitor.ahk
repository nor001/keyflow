val := ""
try val := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")
if val = "1" ;light
{
  val := "0" ;dark
  scale := 175
}
else
{
  val := "1"
  scale := 125
}

run "..\..\..\app_exe\SetDpi.exe " scale
run "main.cpl"
WinWaitActive("Mouse")
Send "{Space}{Enter}"
;regwrite val, "REG_DWORD", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme"
;regwrite val, "REG_DWORD", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "SystemUsesLightTheme"
;run "..\app_sap\mini sap- switch theme.ahk"

send "^+!a" ;para los fancyzones luego del dpi
exitapp