@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
rm %UserProfile%\AppData\Roaming\Code\User\settings.json
cp C:\Code\magic\vscode\settings.json %UserProfile%\AppData\Roaming\Code\User\settings.json
:END
endlocal
