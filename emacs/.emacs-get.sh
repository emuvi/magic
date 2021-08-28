#/bin/bash
read -p "Are you sure? (y/[N])" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

rm ~/Code/magic/emacs/.emacs
cp ~/.emacs ~/Code/magic/emacs/.emacs
