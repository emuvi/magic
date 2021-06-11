import os
import datetime as dt

if __name__ == "__main__":
  weekday = str(dt.datetime.today().weekday())
  newName = "all-" + weekday + "-new.bkp"
  if os.path.exists(newName):
    os.remove(newName)
  if os.system("pg_dumpall --clean -U postgres -v -f " + newName) == 0:
    oldName = "all-" + weekday + "-old.bkp"
    nowName = "all-" + weekday + ".bkp"
    if os.path.exists(oldName):
      os.remove(oldName)
    if os.path.exists(nowName):
      os.rename(nowName, oldName)
    os.rename(newName, nowName)
    print("SUCESS")
    exit(0)
  else:
    if os.path.exists(newName):
      os.remove(newName)
    print("FAIL")
    exit(-1)