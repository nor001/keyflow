; Local secret loader. Real values belong in data/local-secrets.ini or env vars.
loadSecretConstants() {
  global
  local secretsFile := secretsFilePath()
  pathGptNews := secretConfigValue(secretsFile, "pathGptNews", EnvGet("NORMAN_PATH_GPT_NEWS"))
  nttOfficePass := secretConfigValue(secretsFile, "nttOfficePass", EnvGet("NORMAN_NTT_OFFICE_PASS"))
  keepassXc := secretConfigValue(secretsFile, "keepassXc", EnvGet("NORMAN_KEEPASS_XC"))
  keepassProviderCommand := secretConfigValue(secretsFile, "keepassProviderCommand", EnvGet("NORMAN_KEEPASS_PROVIDER_CMD"))
  breakId := secretConfigValue(secretsFile, "breakId", "BREAK-POINT ID abapcg.")
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
