; Orden importante: sap-gui debe cargarse antes que sap-eclipse para mantener precedencia esperada de #HotIf (ej. Logon for Project).
#Include "sap-gui.ahk"
#Include "sap-eclipse.ahk"

trackSapGuiHotkeyUsage(hotkeyId, sourceGroup := "sap-gui") {
  trackHotkeyEvent(hotkeyId, "hotkeys/sap-gui.ahk", sourceGroup)
}

trackSapEclipseHotkeyUsage(hotkeyId, sourceGroup := "sap-eclipse") {
  trackHotkeyEvent(hotkeyId, "hotkeys/sap-eclipse.ahk", sourceGroup)
}
