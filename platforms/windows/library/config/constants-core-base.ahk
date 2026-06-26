loadCoreBaseConstants() {
  global
  constDot := "."
  constDayEs := FormatTime(, "dd.MM.yy")
  constDayEn := FormatTime(, "yy.MM.dd")
  fileScriptname := SubStr(A_ScriptName, 1, StrLen(A_ScriptName) - 4)
  tab := "{tab}"
  enter := "{enter}"
  altf4 := "{!f4}"
  runtimeEnvFile := runtimeEnvFilePath()
  EnvSet("YMT1", runtimeEnvValue(runtimeEnvFile, "YMT1", EnvGet("NORMAN_ENV_YMT1"), "ym.lnk||X|"))
  EnvSet("YSAP", runtimeEnvValue(runtimeEnvFile, "YSAP", EnvGet("NORMAN_ENV_YSAP"), "ym.lnk||X|"))
  sapDefaultTcodeDev := runtimeConfigValue(runtimeEnvFile, "sap-defaults", "defaultTcodeDev", EnvGet("NORMAN_SAP_DEFAULT_TCODE_DEV"), "YMT")
  sapDefaultTcodeQas := runtimeConfigValue(runtimeEnvFile, "sap-defaults", "defaultTcodeQas", EnvGet("NORMAN_SAP_DEFAULT_TCODE_QAS"), "se24")
  sapDefaultTcodeFallback := runtimeConfigValue(runtimeEnvFile, "sap-defaults", "defaultTcodeFallback", EnvGet("NORMAN_SAP_DEFAULT_TCODE_FALLBACK"), "smen")
  sapDelayPollMs := runtimeConfigValue(runtimeEnvFile, "sap-delays", "pollMs", EnvGet("NORMAN_SAP_DELAY_POLL_MS"), "100")
  sapDelayVpnWaitMs := runtimeConfigValue(runtimeEnvFile, "sap-delays", "vpnWaitMs", EnvGet("NORMAN_SAP_DELAY_VPN_WAIT_MS"), "7000")
}

runtimeEnvFilePath() {
  SplitPath(A_LineFile, , &configDir)
  return configDir "\..\..\data\local-startup.ini"
}

runtimeEnvValue(configFile, key, envValue, defaultValue := "") {
  if envValue
    return envValue
  return IniRead(configFile, "runtime-env", key, defaultValue)
}

runtimeConfigValue(configFile, section, key, envValue, defaultValue := "") {
  if envValue
    return envValue
  return IniRead(configFile, section, key, defaultValue)
}
