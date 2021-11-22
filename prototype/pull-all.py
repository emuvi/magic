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
    def __init__(self, name, path):
        Thread.__init__(self)
        self.name = name
        self.path = path

    def run(self):
        result = subprocess.run(
            ["git", "pull"], cwd=self.path, capture_output=True)
        result_text = result.stdout.decode("UTF8")
        result_text += " " + result.stderr.decode("UTF8")
        lock_print(self.name, "pull", result_text)


if (__name__ == '__main__'):
    confirm = input("Do you really wanna PULL all repositories? (y/N): ")
    if confirm == "y":
        os.chdir("..")
        os.chdir("..")
        root = os.getcwd()
        dirs = os.listdir(".")
        threads = []
        for inside in dirs:
            path = os.path.join(root, inside)
            if os.path.isdir(path):
                thread = Runner(inside, path)
                thread.start()
                threads.append(thread)
        for thread in threads:
            thread.join()
