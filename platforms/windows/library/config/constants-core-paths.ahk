loadCorePathConstants() {
  global
  pathAppData := StrReplace(A_AppData, "Roaming")
  pathUser := StrReplace(pathAppData, "AppData\")
  pathOneDrive := EnvGet("onedrive")
  SplitPath(A_LineFile, , &pathScript)
  SplitPath(pathScript, , &pathScript)
  SplitPath(pathScript, , &pathScript)
  SplitPath(pathScript, , &pathScriptOnelevelup)
  dataDir := resolveDataDir(pathScript)
  dataConstantsDir := dataDir
  pathScriptSync := pathScriptOnelevelup "\install_sync\"
  romConfigFile := dataDir "rom.ini"
  memoryVarsIniFile := dataDir "memory-vars.ini"
  hotkeyTrackerJsonFile := dataDir "hotkey-usage.json"
  sapQasSnippetsJsonFile := dataDir "qas-snippets.json"
  constAbapExtProg := ".prog.abap"
  constAbapExtClas := ".clas.abap"
  constAbapExt := ".abap"
  localPathsFile := localPathsFilePath(pathScript)
  pathAbapGitRepo := pathConfigValue(localPathsFile, "pathAbapGitRepo", EnvGet("NORMAN_PATH_ABAP_GIT_REPO"), "H:\.sync\norman_src\abap\abapgit\")
  pathYmWorkspace := pathConfigValue(localPathsFile, "pathYmWorkspace", EnvGet("NORMAN_PATH_YM_WORKSPACE"), "H:\.sync\norman_src\abap\abap-gestor\ym\")
  pathAbapInbox := pathConfigValue(localPathsFile, "pathAbapInbox", EnvGet("NORMAN_PATH_ABAP_INBOX"), "H:\.sync\norman_src\abap\abap-inbox\")
  fileEverythingCli := pathConfigValue(localPathsFile, "fileEverythingCli", EnvGet("NORMAN_FILE_EVERYTHING_CLI"), pathScriptOnelevelup "\exe\everything\es.exe")
  fileFortissl := pathConfigValue(localPathsFile, "fileFortissl", EnvGet("NORMAN_FILE_FORTISSL"), pathScriptOnelevelup "\exe\forticlient\fortisslvpnclient.exe")
  fileFortiClientGui := pathConfigValue(localPathsFile, "fileFortiClientGui", EnvGet("NORMAN_FILE_FORTICLIENT_GUI"), "C:\Program Files\Fortinet\FortiClient\FortiClient.exe")
  filePulseGui := pathConfigValue(localPathsFile, "filePulseGui", EnvGet("NORMAN_FILE_PULSE_GUI"), "C:\Program Files (x86)\Common Files\Pulse Secure\JamUI\Pulse.exe")
  fileNetExtenderGui := pathConfigValue(localPathsFile, "fileNetExtenderGui", EnvGet("NORMAN_FILE_NETEXTENDER_GUI"), "C:\Program Files (x86)\SonicWall\SSL-VPN\NetExtender\NEGui.exe")
}

localPathsFilePath(pathScript) {
  return pathScript "\data\local-paths.ini"
}

pathConfigValue(localPathsFile, key, envValue, defaultValue := "") {
  if envValue
    return envValue
  return IniRead(localPathsFile, "paths", key, defaultValue)
}
