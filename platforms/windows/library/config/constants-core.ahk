loadCoreConstants(){
  loadCoreBaseConstants()
  loadCorePathConstants()
  loadCoreApplicationConstants()
  loadCoreRuleConstants()
}

loadProductionConstants(){
	return loadCoreConstants()
}

resolveDataDir(pathScript) {
  dataPath := pathScript "\data\"
  if DirExist(dataPath)
    return dataPath
  return dataPath
}




