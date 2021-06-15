"""
This script is used to restore a PostgreSQL globals and databases.

Author: Éverton M. Vieira
"""

import os
import sys
import datetime as dt

if __name__ == "__main__":
    confirm = input("Do you wanna restore all globals and databases? (y/N): ")
    if confirm != "y":
        sys.exit(0)
    weekday = str(dt.datetime.today().weekday())
    globalsName = "globals-" + weekday + ".bkp"
    os.system("psql -U postgres -f " + globalsName)
