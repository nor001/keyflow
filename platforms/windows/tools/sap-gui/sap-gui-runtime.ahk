#Requires AutoHotkey v2.0
#SingleInstance Force

; Minimal runtime for tools/sap-gui — intentionally does NOT use bootstrap.ahk.
; bootstrap.ahk initialises all 13 services (including windowGroup, video, snipaste,
; whatsapp, hotstring, hotkeyTracker, everything) and loads hotstring profiles.
; This tool only needs: dynamic, launcher, memory, run, sap.
; If a new service is added to bootstrap.ahk it does NOT need to be mirrored here
; unless this tool explicitly requires it.
SetTitleMatchMode(2)
SetWinDelay(-1)
FileEncoding("UTF-8")
DetectHiddenText(1)
SetWorkingDir(A_ScriptDir "\..\..")

#Include "..\..\library\json-service.ahk"
#Include "..\..\library\util.ahk"
#Include "..\..\library\config\constants-core.ahk"
#Include "..\..\library\config\constants-secrets.ahk"

#Include "..\..\library\automation\dynamic.ahk"
#Include "..\..\library\automation\launcher.ahk"
#Include "..\..\library\automation\memory.ahk"
#Include "..\..\library\automation\run.ahk"
#Include "..\..\library\automation\sap.ahk"

loadCoreConstants()
loadSecretConstants()
global services := sapGuiInitServices()

sapGuiInitServices() {
  return {
    dynamic: DynamicService(),
    launcher: LauncherService(),
    memory: MemoryService(),
    run: RunService(),
    sap: SapService(),
  }
}
