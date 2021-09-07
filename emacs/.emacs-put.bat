setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (y/[N])?
IF /I "%AREYOUSURE%" NEQ "y" GOTO END
rm %UserProfile%\AppData\Roaming\.emacs
cp C:\Code\magic\emacs\.emacs %UserProfile%\AppData\Roaming\.emacs
rm C:\Users\%UserName%\.emacs
cp C:\Code\magic\emacs\.emacs C:\Users\%UserName%\.emacs
rm C:\msys2\home\%UserName%\.emacs
cp C:\Code\magic\emacs\.emacs C:\msys2\home\%UserName%\.emacs
pause
:END
endlocal
