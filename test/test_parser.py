import sys
import os
import glob
import subprocess
import json
import tqdm


def check_ast(ast0, ast1, testcase, command0, command1):
    def wk_exit(n):
        print("---")
        ast0.pop("inner")
        print("current node: ")
        print(ast0)
        print("---")
        print(command0)
        print(command1)
        exit(n)

    if type(ast0) != type(ast1):
        print("fail: type err.")
        wk_exit(0)

    key_inner = ["inner"]

    if testcase in ["parser-0"]:
        key_kind = ["kind", "name", "value"]
    elif testcase in ["parser-1"]:
        key_kind = ["kind", "name", "value", "type"]
    elif testcase in ["parser-2"]:
        key_kind = ["kind", "name", "value", "type", "range"]
    else:
        key_kind = []
    key_ignore = ["id"]
    for key, value0 in ast0.items():
        if key in key_ignore:
            continue

        def get_value1():
            if key not in ast1:
                print("fail: key '"+key+"' not find")
                wk_exit(0)
            return ast1.get(key)

        if key in key_inner:
            if ast0.get("kind") == "TranslationUnitDecl":
                while len(value0[0].get("loc")) == 0:
                    value0.pop(0)
            value1 = get_value1()
            if len(value0) != len(value1):
                print("fail: inner not match")
                wk_exit(0)
            for i in range(len(value0)):
                check_ast(value0[i], value1[i],
                          testcase, command0, command1)
        elif len(key_kind) == 0 or key in key_kind:
            value1 = get_value1()
            if value0 != value1:
                print("fail: key not match")
                print(key)
                wk_exit(0)


if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("fail: incorrect argv.")
        print(
            "usage: pathon3 test-parser.py <parser-[0-3]> `preprocessor` `which clang` `which sysu-parser`")
        exit(0)
    testcase = sys.argv[1]
    preprocessor = sys.argv[2]
    clang = sys.argv[3]
    parser = sys.argv[4]
    filenames = [os.path.dirname(sys.argv[0])+"/functional/000_main.sysu.c"] if testcase in [
        "parser-0"] else glob.glob(os.path.dirname(sys.argv[0])+"/*/*.sysu.c")
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
        command1 = command+" | "+parser
        ast0 = json.loads(subprocess.run(
            clang, input=src, stdout=subprocess.PIPE, shell=True).stdout)
        ast1 = json.loads(subprocess.run(
            parser, input=src, stdout=subprocess.PIPE, shell=True).stdout)

        check_ast(ast0, ast1, testcase, command0, command1)
