"""
This script is used to restore a PostgreSQL globals and databases.

Author: Éverton M. Vieira
"""

import os
import sys
import datetime as dt


def __restore_database(file_name):
    if os.system("pg_restore --clean -U postgres --format tar --verbose " +
                 " -f " + file_name) == 0:
        print("Successfully restore database " + file_name)
    else:
        print("Fail on restore databse " + file_name)
        sys.exit(-1)


if __name__ == "__main__":
    confirm = input("Do you wanna restore all globals and databases? (y/N): ")
    if confirm != "y":
        sys.exit(0)
    weekday = str(dt.datetime.today().weekday())
    globalsName = "globals-" + weekday + ".bkp"
    if os.system("psql -U postgres -f " + globalsName) == 0:
        print("Successfully restore globals.")
    else:
        print("Fail on restore globals.")
        sys.exit(-1)
    for inside in os.listdir("."):
        if inside.startswith("db-") and inside.endswith(".bkp"):
            __restore_database(inside)
