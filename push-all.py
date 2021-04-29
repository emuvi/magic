import os

if (__name__ == '__main__'):
  confirmar = input("Do you realy wanna PUSH all repositories? (y/N) ")
  if confirmar == "y":
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