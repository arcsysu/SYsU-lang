import sys
import os
import glob

if __name__ == "__main__":
    for filename in glob.iglob(os.path.dirname(sys.argv[0])+"/*/*.sy"):
        file = open(filename, mode="r")
        src = file.read()
        file.close()
        for pattern in ["getint" , "getch" , "getarray" , "putint" , "putch" , "putarray" , "starttime" , "stoptime"]:
            if src.find(pattern) != -1:
                src = "#include <sylib.h>\n"+src
                break
        file = open(filename+".su.c", mode="w")
        file.write(src)
        file.close()
