import sys
import os
import glob
import subprocess

if __name__ == "__main__":
    for filename in glob.iglob(os.path.dirname(sys.argv[0])+"/*/*.in"):
        subprocess.run(["gzip", "-9", filename])
