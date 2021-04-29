import os

if (__name__ == '__main__'):
  dirs = os.listdir(".")
  for file in dirs:
    if os.path.isdir(file):
      print("Starting on " + file)
      os.chdir(file)
      os.system("git pull")
      os.chdir("../")
      print("----------------------------------------------------")