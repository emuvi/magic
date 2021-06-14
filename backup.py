import os
import datetime as dt

weekday = str(dt.datetime.today().weekday())

def backup_globals():
  newName = "globals-" + weekday + "-new.bkp"
  if os.path.exists(newName):
    os.remove(newName)
  if os.system("pg_dumpall --clean -U postgres -v --globals-only -f " + newName) == 0:
    oldName = "globals-" + weekday + "-old.bkp"
    nowName = "globals-" + weekday + ".bkp"
    if os.path.exists(oldName):
      os.remove(oldName)
    if os.path.exists(nowName):
      os.rename(nowName, oldName)
    os.rename(newName, nowName)
    print("Successfully finish to backup of globals")
  else:
    if os.path.exists(newName):
      os.remove(newName)
    print("Fail backup of globals")


def list_databases():
  db_list = []
  process = os.popen('psql -U postgres -c "SELECT datname FROM pg_database;"')
  result = process.read()
  started = False
  for line in result.splitlines():
    line = line.strip()
    if not started:
      if line.startswith('-'):
        started = True
    else:
      if line.startswith('('):
        started = False
      elif not line.startswith('template'):
        db_list.append(line)
  return db_list


def backup_database(dbname):
  newName =  "db-" + dbname + "-" + weekday + "-new.bkp"
  if os.path.exists(newName):
    os.remove(newName)
  if os.system("pg_dump --clean -d " + dbname + " -U postgres --format tar --blobs --encoding UTF8 --verbose -f " + newName) == 0:
    oldName = "db-" + dbname + "-" + weekday + "-old.bkp"
    nowName = "db-" + dbname + "-" + weekday + ".bkp"
    if os.path.exists(oldName):
      os.remove(oldName)
    if os.path.exists(nowName):
      os.rename(nowName, oldName)
    os.rename(newName, nowName)
    print("Successfully finish to backup database " + dbname)
  else:
    if os.path.exists(newName):
      os.remove(newName)
    print("Fail backup database " + dbname)


if __name__ == "__main__":
  backup_globals()
  for dbname in list_databases():
    backup_database(dbname)