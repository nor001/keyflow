; Local secret loader. Real values belong in data/local-secrets.ini.
loadSecretConstants() {
  global
  local secretsFile := secretsFilePath()
  nttOfficePass := secretConfigValue(secretsFile, "nttOfficePass", "")
  keepassProviderCommand := secretConfigValue(secretsFile, "keepassProviderCommand", "")
}

secretsFilePath() {
  dataSecrets := A_ScriptDir "\data\local-secrets.ini"
  if FileExist(dataSecrets)
    return dataSecrets
  return dataSecrets
}

secretConfigValue(secretsFile, key, defaultValue := "") {
  return IniRead(secretsFile, "secrets", key, defaultValue)
}

loadTestModeConstants() {
  return loadSecretConstants()
}
