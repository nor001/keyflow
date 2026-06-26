#Include "domains\comms.ahk"
#Include "domains\media-web.ahk"
#Include "domains\productivity.ahk"

trackDomainsHotkeyUsage(hotkeyId, sourceGroup := "domains", sourceFile := "hotkeys/domains.ahk") {
  trackHotkeyEvent(hotkeyId, sourceFile, sourceGroup)
}
