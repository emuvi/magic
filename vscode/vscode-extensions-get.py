

def get_extensions():
    del_process = os.popen('code --list-extensions')
    writer = open("vscode-extensions.txt", 'w', encoding='utf-8')
    writer.write(del_process.read())
    writer.close()


if __name__ == "__main__":
    get_extensions()
    print("Finish to get extensions.")
