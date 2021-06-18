@ECHO OFF
rm C:\Users\Usuario\AppData\Roaming\.emacs
cp C:\Code\dotfiles\.emacs C:\Users\Usuario\AppData\Roaming\.emacs
rm C:\msys2\home\Usuario\.emacs
cp C:\Code\dotfiles\.emacs C:\msys2\home\Usuario\.emacs
