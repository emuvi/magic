"""
This script is used to restore a PostgreSQL globals and databases.

Author: Éverton M. Vieira
"""

import os
import sys
import datetime as dt


def __restore_database(file_name):
    print("Restoring file: " + file_name + "...")
    dbname = file_name[3:len(file_name)-6]
    print("Restoring database: " + dbname)
    os.system('psql -h localhost -U postgres -c "DROP DATABASE '
              + dbname + '"')
    os.system('psql -h localhost -U postgres -c "CREATE DATABASE '
              + dbname + '"')
    os.system("pg_restore --clean -h localhost -U postgres -d "
              + dbname + " --format tar -v " + file_name)


if __name__ == "__main__":
    confirm = input("Do you wanna restore all globals and databases? (y/N): ")
    if confirm != "y":
        sys.exit(0)
    weekday = str(dt.datetime.today().weekday())
    globalsName = "globals-" + weekday + ".bkp"
    if os.system("psql -h localhost -U postgres -f " + globalsName) == 0:
        print("Successfully restore globals.")
    else:
        print("Fail on restore globals.")
        sys.exit(-1)
    for inside in os.listdir("."):
        if inside.startswith("db-") and inside.endswith(".bkp"):
            __restore_database(inside)
