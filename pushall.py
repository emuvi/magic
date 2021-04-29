import os

if (__name__ == '__main__'):
  dirs = os.listdir(".")
  for file in dirs:
    if os.path.isdir(file):
      print("Starting on " + file)
      os.chdir(file)
      os.system("git add -A")
      os.system("git commit -m \"prototype development\"")
      os.system("git push")
      os.chdir("../")
      print("----------------------------------------------------")