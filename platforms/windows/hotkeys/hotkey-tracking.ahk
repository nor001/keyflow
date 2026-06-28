trackHotkeyEvent(hotkeyId, sourceFile := "hotkeys/global.ahk", sourceGroup := "global") {
  if IsSet(services) && services.HasOwnProp("hotkeyTracker")
    services.hotkeyTracker.track(hotkeyId, sourceFile, sourceGroup)
}

trackSapGuiHotkeyUsage(hotkeyId, sourceGroup := "sap-gui") {
  trackHotkeyEvent(hotkeyId, "hotkeys/sap-gui.ahk", sourceGroup)
}

trackSapEclipseHotkeyUsage(hotkeyId, sourceGroup := "sap-eclipse") {
  trackHotkeyEvent(hotkeyId, "hotkeys/sap-eclipse.ahk", sourceGroup)
}

trackEditorsHotkeyUsage(hotkeyId, sourceGroup := "editors", sourceFile := "hotkeys/editors.ahk") {
  trackHotkeyEvent(hotkeyId, sourceFile, sourceGroup)
}

trackDomainsHotkeyUsage(hotkeyId, sourceGroup := "domains", sourceFile := "hotkeys/domains.ahk") {
  trackHotkeyEvent(hotkeyId, sourceFile, sourceGroup)
}
