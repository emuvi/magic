setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (y/[N])?
IF /I "%AREYOUSURE%" NEQ "y" GOTO END
rm %UserProfile%\AppData\Roaming\Code\User\settings-old.json
mv %UserProfile%\AppData\Roaming\Code\User\settings.json %UserProfile%\AppData\Roaming\Code\User\settings-old.json
cp C:\Code\magic\vscode\settings.json %UserProfile%\AppData\Roaming\Code\User\settings.json
pause
:END
endlocal
