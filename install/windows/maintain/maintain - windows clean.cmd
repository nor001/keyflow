for /d %%i in ("%userprofile%\appdata\local\*updater*") do rmdir /s /q "%%i"
rmdir /s /q %userprofile%\appdata\local\crashdumps
rmdir /s /q "%userprofile%\appdata\local\package cache"
rmdir /s /q %userprofile%\appdata\local\temp
rmdir /s /q %userprofile%\appdata\local\vmware
rmdir /s /q %userprofile%\appdata\local\zscaler

rmdir /s /q %userprofile%\appdata\roaming\quickaccess\logs
rmdir /s /q %userprofile%\appdata\roaming\Zoom\ZoomDownload

::taskkill /f /im code.exe
::rmdir /s /q %userprofile%\.vscode
::rmdir /s /q %userprofile%\.vscode-oss
::taskkill /f /im chrome.exe
::rmdir /s /q %userprofile%\appdata\local\google
::rmdir /s /q %userprofile%\appdata\local\microsoft
::taskkill /f /im msedge.exe
::del /s /q "%userprofile%\appdata\local\microsoft\edge\userdata\profile 1\cache"
::taskkill /f /im outlook.exe
::del /s /q %userprofile%\appdata\local\microsoft\outlook\*.ost
::taskkill /f /im firefox.exe
::rmdir /s /q %userprofile%\appdata\local\mozilla
::taskkill /f /im notion.exe
::rmdir /s /q %userprofile%\appdata\local\notion
::taskkill /f /im ms-teams.exe
::rmdir /s /q %userprofile%\appdata\local\packages\MSTeams_8wekyb3d8bbwe\LocalCache
::rmdir /s /q %userprofile%\appdata\local\teamviewer

::rmdir /s /q %userprofile%\appdata\roaming\code\cache
::rmdir /s /q %userprofile%\appdata\roaming\code\cacheddata
::rmdir /s /q %userprofile%\appdata\roaming\cursor\cache\
::rmdir /s /q %userprofile%\appdata\roaming\logseq\cache

::taskkill /f /im excel.exe
::rmdir /s /q %userprofile%\appdata\roaming\microsoft\excel
::rmdir /s /q "%userprofile%\appdata\roaming\microsoft\internet explorer\quick launch\user pinned\taskbar"
rmdir /s /q %userprofile%\appdata\roaming\microsoft\office\recent
rmdir /s /q %userprofile%\appdata\roaming\microsoft\templates\livecontent
rmdir /s /q %userprofile%\appdata\roaming\microsoft\windows\recent
::taskkill /f /im winword.exe
rmdir /s /q %userprofile%\appdata\roaming\microsoft\word
::taskkill /f /im obsidian.exe
::rmdir /s /q %userprofile%\appdata\roaming\obsidian\cache

del /s /q %systemdrive%\$Recycle.bin
cleanmgr /verylowdisk /d

powershell -ExecutionPolicy Bypass -Command "& 'c:\temp\maintain - windows repair.ps1'"
