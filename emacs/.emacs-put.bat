@echo off
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
rm %UserProfile%\AppData\Roaming\.emacs
cp C:\Code\magic\emacs\.emacs %UserProfile%\AppData\Roaming\.emacs
rm C:\msys2\home\%UserName%\.emacs
cp C:\Code\magic\emacs\.emacs C:\msys2\home\%UserName%\.emacs
:END
endlocal
