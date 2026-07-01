@echo off
setlocal

echo Setting workstation root anchors for Windows...
setx WORKSTATION_DATA_ROOT H:
setx WORKSTATION_BACKUP_ROOT D:

echo.
echo Open a new terminal, then validate:
echo   echo %%WORKSTATION_DATA_ROOT%%
echo   echo %%WORKSTATION_BACKUP_ROOT%%

endlocal
