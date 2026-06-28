class VideoService {
  control() {
    prevId := WinExist("A")

    key := "{" A_Thishotkey "}"

    wasTargetActivated := this._activate(exeMediaPlayerClassic)
    if !wasTargetActivated
      wasTargetActivated := this._activate("Curso")
    if !wasTargetActivated
      wasTargetActivated := this._activate(titleUdemyPlatform)
    if !wasTargetActivated
      wasTargetActivated := this._activate(titleYoutube)
    if !wasTargetActivated
      wasTargetActivated := this._activate(exeVlc)
    if wasTargetActivated
    {
      Sleep(100)
      Send("{space}")
      Sleep(100)
      WinActivate("ahk_id " prevId)
    }
    else
      Send(key)
  }

  _activate(win) {
    if WinExist(win)
    {
      WinActivate(win)
      return true
    }
  }
}
