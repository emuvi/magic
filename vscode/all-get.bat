setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (y/[N])?
IF /I "%AREYOUSURE%" NEQ "y" GOTO END
rm C:\Code\magic\vscode\settings-old.json
mv C:\Code\magic\vscode\settings.json C:\Code\magic\vscode\settings-old.json
cp %UserProfile%\AppData\Roaming\Code\User\settings.json C:\Code\magic\vscode\settings.json
rm C:\Code\magic\vscode\keybindings-old.json
mv C:\Code\magic\vscode\keybindings.json C:\Code\magic\vscode\keybindings-old.json
cp %UserProfile%\AppData\Roaming\Code\User\keybindings.json C:\Code\magic\vscode\keybindings.json
python vscode-extensions-get.py
pause
:END
endlocal
