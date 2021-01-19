#!/usr/bin/python
import os

del_process = os.popen('code --list-extensions')
for del_extension in del_process.read().splitlines():
    result = os.popen('code --uninstall-extension ' + del_extension.strip())
    print(result.read())

add_file = open('vscode-extensions.txt', 'r')
for add_extension in add_file.readlines():
    result = os.popen('code --install-extension ' + add_extension.strip())
    print(result.read())


print("Finished to install VSCode extensions.")
