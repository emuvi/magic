import os
import subprocess
from threading import Thread
from multiprocessing import Lock


lock = Lock()


def lock_print(origin: str, stage: str, result:str):
    result = result.replace("\r", "")
    result = result.replace("\n", " ")
    while result.find("  ") > -1:
        result = result.replace("  ", " ")
    result = result.strip()
    if result:
        with lock:
            print("From " + origin + " on " + stage + " : " + result, flush=True)


class Runner(Thread):
    def __init__(self, name):
        Thread.__init__(self)
        self.name = name

    def run(self):
        result = subprocess.run(["git", "clone", "https://github.com/emuvi/" + self.name], capture_output=True)
        result_text = result.stdout.decode("UTF8")
        result_text += " " + result.stderr.decode("UTF8")
        lock_print(self.name, "clone", result_text)


def get_projects():
    print("Getting projects...")
    result = []
    file = open('clone.txt', 'r')
    for project in file.readlines():
        project = project.strip()
        if project:
            result.append(project)
    return result


if (__name__ == '__main__'):
    confirm = input("Do you really wanna CLONE all repositories? (y/N): ")
    if confirm == "y":
        projects = get_projects()
        os.chdir("..")
        os.chdir("..")
        threads = []
        for project in projects:
            thread = Runner(project)
            thread.start()
            threads.append(thread)
        for thread in threads:
            thread.join()
