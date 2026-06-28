class LauncherService {
  supportedPasteExtensionsPattern := "i)(txt|abap|md|ahk)"

  _isMediaPath(filename) {
    return InStr(filename, "music") or InStr(filename, "audio") or InStr(filename, "video")
  }

  dismissLauncherUi(shortWait := true) {
    If winactive(exeEverything)
    {
      Sleep(50)
      Send("^{w}")
    }

    if winactive(exeSwitcheroo) or WinActive(exeFlowlauncher)
      Send("{esc}")

    Sleep(shortWait ? 10 : 500)
  }

  openSelectedMedia() {
    filename := utilClipboardRead("^+c", 0.3)

    if this._isMediaPath(filename)
    {
      this.dismissLauncherUi()
      services.everything.incrementRunCount(filename)
      services.run.runCommand("aimpportable " filename)
    }
  }

  pasteSelectedFiles() {
    files := this._readSelectedFiles()
    pastedAny := false

    this.dismissLauncherUi()

    Loop Parse, files, "`n", "`r"
    {
      selectedFile := A_Loopfield
      if !this._isPasteableTextFile(selectedFile)
        continue
      if !FileExist(selectedFile)
        continue

      services.everything.incrementRunCount(selectedFile)
      utilPaste(Fileread(selectedFile), True)
      pastedAny := true
    }

    this._waitAfterPaste()

    utilTooltip("Pasted", pastedAny ? "ok" : "no valid file")
  }

  saveClipboardToSelectedFile() {
    codes := A_Clipboard
    selectedFile := this._readSelectedFile()

    this.dismissLauncherUi()

    If codes and selectedFile
    {
      services.everything.incrementRunCount(selectedFile)
      FileDelete(selectedFile)
      FileAppend(codes, selectedFile, "UTF-8")
      A_Clipboard := ""
    }

    utilTooltip("Saved", selectedFile)
  }

  _readSelectedFiles() {
    files := utilClipboardRead("^+c", 0.7)
    if !files
    {
      Send("{down}")
      files := utilClipboardRead("^+c", 0.7)
    }
    return files
  }

  _readSelectedFile() {
    if winactive(exeXyplorer)
      return utilClipboardRead("^p", 0.5)
    return utilClipboardRead("^+c", 0.4)
  }

  _isPasteableTextFile(filename) {
    return (filename ~= this.supportedPasteExtensionsPattern)
  }

  _waitAfterPaste() {
    If WinActive("YM")
    {
      Sleep 3000
      Send("^{f3}")
      return
    }
    Sleep 200
  }
}
