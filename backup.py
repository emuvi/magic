"""
This script is used to backup a PostgreSQL globals and databases.

Author: Éverton M. Vieira
"""

import os
import datetime as dt


def __backup_globals():
    newName = "globals-" + weekday + "-new.bkp"
    if os.path.exists(newName):
        os.remove(newName)
    if os.system("pg_dumpall --clean -U postgres -v --globals-only " +
                 "-f " + newName) == 0:
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


def __list_databases():
    db_list = []
    process = os.popen(
        'psql -U postgres -c "SELECT datname FROM pg_database;"')
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


def __backup_database(dbname):
    newName = "db-" + dbname + "-" + weekday + "-new.bkp"
    if os.path.exists(newName):
        os.remove(newName)
    if os.system("pg_dump --clean -d " + dbname + " -U postgres " +
                 "--format tar --blobs --encoding UTF8 --verbose " +
                 "-f " + newName) == 0:
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


weekday = str(dt.datetime.today().weekday())


if __name__ == "__main__":
    __backup_globals()
    for dbname in __list_databases():
        __backup_database(dbname)
