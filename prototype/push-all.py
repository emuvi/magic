import os
import sys
import subprocess
from threading import Thread
from multiprocessing import Lock


lock = Lock()


def lock_print(msg):
    with lock:
        msg = msg.replace("\n", " ")
        msg = msg.replace("\r", "")
        print(msg, flush=True)


class Runner(Thread):
    def __init__(self, name, path):
        Thread.__init__(self)
        self.name = name
        self.path = path

    def run(self):
        lock_print("Starting on " + self.name)
        with subprocess.Popen(["git", "add", "-A"], cwd=self.path, stdout=subprocess.PIPE) as proc:
            out = proc.stdout.read().decode("utf-8")
            lock_print("From " + self.name + ": " + out)
        with subprocess.Popen(["git", "commit", "-m", "prototype development"], cwd=self.path, stdout=subprocess.PIPE) as proc:
            out = proc.stdout.read().decode("utf-8")
            lock_print("From " + self.name + ": " + out)
        with subprocess.Popen(["git", "push"], cwd=self.path, stdout=subprocess.PIPE) as proc:
            out = proc.stdout.read().decode("utf-8")
            lock_print("From " + self.name + ": " + out)


if (__name__ == '__main__'):
    confirm = input("Do you really wanna PUSH all repositories? (y/N): ")
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
