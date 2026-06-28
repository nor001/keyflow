class SnipasteService {
  __new() {
    this.ctrlCSourceExe := ""
  }

  ctrlC(){
    try this.ctrlCSourceExe := WinGetProcessname("A")
  }

  copyPaste(key, snipasteTargets := []) {
    this.ctrlCSourceExe := ""
    A_Clipboard := ""
    Sleep(100)
    if key
    {
      Send(key)
      Sleep(500)
    }
    WinWaitClose(titleSnipaste)

    If !this._hasImageInClipboard()
      Exit()

    sleep(100)
    MouseGetPos(, , &_mid)
    mouseExe := WinGetProcessname("ahk_id " _mid)
    id := this._lastEditorActive(snipasteTargets)
    title := exe := ""
    try exe := WinGetProcessName(id)
    try title := wingettitle(id)
    If instr(exe, mouseExe) or !title
      Exit()

    WinActivate(title)
    WinWaitActive(title, , 3)

    for target in snipasteTargets
    {
      if instr(target[2], exe) or instr(title, target[2])
      {
        if instr(target[1], "magick")
        {
          services.run.runCommand("magick clipboard: -resize 80% clipboard:")
          utilTooltip("magick clipboard 80%")
          sleep 600
        }
        if instr(target[1], "paste")
          Send("^v")
        if instr(target[1], "resize")
          this.resizeOffice("70")
        break
      }
    }

    If utilIsExit()
      Exit()
  }

  pasteResizeOffice(size := "80", paste := "") {
    IF paste
      Send("^v")
    If this._hasImageInClipboard() AND this.ctrlCSourceExe != "EXCEL.EXE"
    {
      Sleep(500)
      Send("+{left}")
      this.resizeOffice(size)
    }

    this.ctrlCSourceExe := ""
  }

  resizeOffice(size) {
    Send("{appskey}{z}")
    If WinWaitActive("Layout", , 5)
    {
      ControlClick(controlOfficeImage)
      If (StrReplace(ControlGetText(controlOfficeImage), "%") > size)
      {
        ControlSetText(size, controlOfficeImage)
        Send("{space}{enter}{right}")
      }
      Else
        Send("{esc}")
    }
  }

  _lastEditorActive(snipasteTargets := []) {
    managers := WinGetList(, , "Program Manager",)
    for manager in managers
    {
      id := "ahk_id " manager
      exe := "ahk_exe " WinGetProcessname(id)
      title := WinGetTitle(id)
      If !title or !utilIsWindow(id)
        continue
      for target in snipasteTargets
      {
        If exe = target[2] or InStr(title, target[2])
          return id
      }
    }
  }

  _hasImageInClipboard() {
    return DllCall("IsClipboardFormatAvailable", "Uint", 2)
  }
}
