import os
import subprocess
from threading import Thread


class Runner(Thread):
    def __init__(self, name, path):
        Thread.__init__(self)
        self.name = name
        self.path = path

    def run(self):
        print("Starting on " + self.name)
        with subprocess.Popen(["git", "pull"], cwd=self.path, stdout=subprocess.PIPE) as proc:
            print("From " + self.name + ": " + str(proc.stdout.read().decode("utf-8")))


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
