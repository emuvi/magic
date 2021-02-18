import os

del_process = os.popen('code --list-extensions')
writer = open("vscode-extensions.txt", 'w', encoding='utf-8')
writer.write(del_process.read())
writer.close()