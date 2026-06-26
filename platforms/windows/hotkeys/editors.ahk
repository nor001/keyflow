#Include "editors-ide.ahk"
#Include "editors-office.ahk"
#Include "editors-text.ahk"

trackEditorsHotkeyUsage(hotkeyId, sourceGroup := "editors", sourceFile := "hotkeys/editors.ahk") {
  trackHotkeyEvent(hotkeyId, sourceFile, sourceGroup)
}
