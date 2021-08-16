import os
import sys
import struct
import ftplib


def __get_os():
    if sys.platform.startswith('linux'):
        return "lin"
    elif sys.platform.startswith('win'):
        return "win"
    elif sys.platform.startswith('darwin'):
        return "mac"
    else:
        raise "Error: Operation system not supported."


def __get_arch():
    return str(struct.calcsize("P")*8)


def __check_if_is_rust_program(path):
    if os.path.isdir(path):
        cargo_file = os.path.join(path, "Cargo.toml")
        main_file = os.path.join(path, "src", "main.rs")
        return os.path.exists(cargo_file) and os.path.exists(main_file)


def __build_rust_program(path):
    print("Building Rust program...")
    os.chdir(path)
    os.system("cargo build --release")


def __get_binary_path(path, name):
    extension = ".exe" if __get_os() == "win" else ""
    return os.path.join(path, "target", "release", name + extension)


__ftp = None


def __get_ftp():
    global __ftp
    if __ftp == None:
        __ftp = ftplib.FTP(os.getenv('POINTEL_FTP_HOST'), os.getenv(
            'POINTEL_FTP_USER'), os.getenv('POINTEL_FTP_PASS'))
    return __ftp


def __close_ftp():
    global __ftp
    if __ftp != None:
        __ftp.close()
        __ftp = None


def __publish_rust_program(path, name):
    __build_rust_program(path)
    binary_path = __get_binary_path(path, name)
    print("Binary path: " + binary_path)
    if not os.path.exists(binary_path):
        raise "Error: Could not found binary path."
    ftp = __get_ftp()
    ftp.cwd("/public_html")
    ftp.mkd("qinpel")
    ftp.cwd("./qinpel")
    files = ftp.dir()
    print(files)


def __process_ci_cmds():
    os.chdir("..")
    root_dir = os.getcwd()
    dirs = os.listdir(".")
    for inside in dirs:
        path = os.path.join(root_dir, inside)
        if __check_if_is_rust_program(path):
            print("Found Rust program: " + inside)
            __publish_rust_program(path, inside)
            print("----------------------------------------------------")


if __name__ == "__main__":
    print("Operation system: " + __get_os())
    print("System architecture: " + __get_arch())
    confirm = input("Do you really wanna PUBLISH all Rust programs? (y/N): ")
    if confirm == "y":
        __process_ci_cmds()
        __close_ftp()
