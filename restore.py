import os
import datetime as dt

if __name__ == "__main__":
  confirm = input("Do you realy wanna restore all databases? (y/N): ")
  if confirm == "y":
    weekday = str(dt.datetime.today().weekday())
    nowName = "all-" + weekday + ".bkp"
    os.system("psql -U postgres -f " + nowName)