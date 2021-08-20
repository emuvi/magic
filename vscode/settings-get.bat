@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (y/[N])?
IF /I "%AREYOUSURE%" NEQ "y" GOTO END
rm C:\Code\magic\vscode\settings-old.json
mv C:\Code\magic\vscode\settings.json C:\Code\magic\vscode\settings-old.json
cp %UserProfile%\AppData\Roaming\Code\User\settings.json C:\Code\magic\vscode\settings.json
:END
endlocal
