import os

if (__name__ == '__main__'):
  confirm = input("Do you really wanna PULL all repositories? (y/N): ")
  if confirm == "y":
    os.chdir("..")
    dirs = os.listdir(".")
    for file in dirs:
      if os.path.isdir(file):
        print("Starting on " + file)
        os.chdir(file)
        os.system("git pull")
        os.chdir("../")
        print("----------------------------------------------------")