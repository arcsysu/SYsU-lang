import sys
import os
import glob
import subprocess
import tqdm

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("fail: incorrect argv.")
        print(
            "usage: pathon3 test-lexer.py <lexer-[0-3]> `preprocessor` `which clang` `which sysu-lexer`")
        exit(0)
    testcase = sys.argv[1]
    preprocessor = sys.argv[2]
    clang = sys.argv[3]
    lexer = sys.argv[4]
    filenames = [os.path.join(os.path.dirname(os.path.abspath(__file__)), "functional", "000_main.sysu.c")] if testcase in [
        "lexer-0"] else glob.glob(os.path.join(os.path.dirname(os.path.abspath(__file__)), "**", "*.sysu.c"), recursive=True)
    filenames = tqdm.tqdm(filenames)
    for filename in filenames:
        filenames.set_description(filename)
        if os.path.getsize(filename) >= 32768:
            # 慎重测试！
            continue
        command = "cat "+filename+" | "+preprocessor
        src = subprocess.run(
            command, stdout=subprocess.PIPE, shell=True).stdout
        command0 = command+" | "+clang
        command1 = command+" | "+lexer
        tokens0 = subprocess.run(
            clang, input=src, stdout=subprocess.PIPE, shell=True).stdout.splitlines()
        tokens1 = subprocess.run(
            lexer, input=src, stdout=subprocess.PIPE, shell=True).stdout.splitlines()

        def wk_exit(n):
            print("---")
            print(command0)
            print(command1)
            exit(n)

        if len(tokens0) != len(tokens1):
            print("fail: counts of tokens are different")
            wk_exit(0)
        for i in range(len(tokens0)):
            def split_tokens(t):
                tmp = str(t, encoding="utf8")
                k1 = tmp.find("'")
                k2 = tmp.rfind("'")
                k3 = tmp.rfind("Loc=<")
                if k1 == -1 or k2 == -1 or k3 == -1:
                    print("fail: format error")
                    print("---")
                    print(t)
                    wk_exit(0)
                tok0 = tmp.split()[0].strip()
                str0 = tmp[k1+1:k2].strip()
                mid0 = str(tmp[k2+1:k3].strip().split())
                loc0 = tmp[k3:].strip()
                return [tok0, str0, mid0, loc0]
            tok0, str0, mid0, loc0 = split_tokens(tokens0[i])
            tok1, str1, mid1, loc1 = split_tokens(tokens1[i])

            if testcase in ["lexer-3"]:
                if mid0 != mid1:
                    print("fail: mid " + str(i+1) + "c" + str(i+1))
                    print("< " + mid0)
                    print("---")
                    print("> " + mid1)
                    wk_exit(0)
            if testcase in ["lexer-2", "lexer-3"]:
                if loc0 != loc1:
                    print("fail: loc " + str(i+1) + "c" + str(i+1))
                    print("< " + loc0)
                    print("---")
                    print("> " + loc1)
                    wk_exit(0)
            if testcase in ["lexer-0", "lexer-1", "lexer-2", "lexer-3"]:
                if tok0 != tok1:
                    print("fail: tok " + str(i+1) + "c" + str(i+1))
                    print("< " + tok0)
                    print("---")
                    print("> " + tok1)
                    wk_exit(0)
                if str0 != str1:
                    print("fail: str " + str(i+1) + "c" + str(i+1))
                    print("< " + str0)
                    print("---")
                    print("> " + str1)
                    wk_exit(0)
