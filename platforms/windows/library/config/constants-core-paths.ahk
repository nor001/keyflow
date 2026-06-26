loadCorePathConstants() {
  global
  pathOneDrive := EnvGet("onedrive")
  SplitPath(A_LineFile, , &pathScript)
  SplitPath(pathScript, , &pathScript)
  SplitPath(pathScript, , &pathScript)
  SplitPath(pathScript, , &pathScriptOnelevelup)
  dataDir := resolveDataDir(pathScript)
  memoryVarsIniFile := dataDir "memory-vars.ini"
  hotkeyTrackerJsonFile := dataDir "hotkey-usage.json"
  localPathsFile := localPathsFilePath(pathScript)
  pathAbapGitRepo := pathConfigValue(localPathsFile, "pathAbapGitRepo", "")
  pathYmWorkspace := pathConfigValue(localPathsFile, "pathYmWorkspace", "")
  pathAbapInbox := pathConfigValue(localPathsFile, "pathAbapInbox", "")
  fileEverythingCli := pathConfigValue(localPathsFile, "fileEverythingCli", pathScriptOnelevelup "\exe\everything\es.exe")
}

localPathsFilePath(pathScript) {
  return pathScript "\data\local-paths.ini"
}

pathConfigValue(localPathsFile, key, defaultValue := "") {
  return IniRead(localPathsFile, "paths", key, defaultValue)
}
