import os


def get_old_extensions():
    print("Getting old extensions...")
    result = []
    process = os.popen('code --list-extensions')
    for extension in process.read().splitlines():
        extension = extension.strip()
        if extension:
            result.append(extension)
    return result


def get_new_extensions():
    print("Getting new extensions...")
    result = []
    file = open('vscode-extensions.txt', 'r')
    for extension in file.readlines():
        extension = extension.strip()
        if extension:
            result.append(extension)
    return result


def which_were_deleted(old_extensions, new_extensions):
    print("Getting deleted extensions...")
    result = []
    for old_extension in old_extensions:
        if not old_extension in new_extensions:
            result.append(old_extension)
    return result


def call_code(command, extensions, param = ''):
    remains = []
    remains.extend(extensions)
    while remains:
        extensions.clear();
        extensions.extend(remains)
        for extension in extensions:
            process = os.popen('code ' + command + ' ' + extension + ' ' + param)
            print(process.read())
            if not process.close():
                remains.remove(extension)


def uninstall_deleted(del_extensions):
    print("Deleting old extensions...")
    call_code('--uninstall-extension', del_extensions)


def install_all(new_extensions):
    print("Installing new extensions...")
    call_code('--install-extension', new_extensions, "--force")


if __name__ == "__main__":
    old_extensions = get_old_extensions()
    new_extensions = get_new_extensions()
    del_extensions = which_were_deleted(old_extensions, new_extensions);
    uninstall_deleted(del_extensions)
    install_all(new_extensions)
    print("Finished to install extensions.")
