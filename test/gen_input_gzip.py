import sys
import os
import glob
import subprocess


def main(argv):
    for filename in glob.glob(os.path.join(os.path.dirname(os.path.abspath(__file__)), "**", "*.in"), recursive=True):
        subprocess.run(["gzip", "-9", filename])


if __name__ == "__main__":
    main(sys.argv)
