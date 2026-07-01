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

Run "..\exe\SetDpi.exe " scale
Run "main.cpl"
WinWaitActive("Mouse")
Send "{Space}{Enter}"

Send "^+!a" ; FancyZones refresh after DPI change
ExitApp
