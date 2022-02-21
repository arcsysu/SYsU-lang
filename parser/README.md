# sysu-parser

## 实验描述

本次语法分析实验中，你被希望完成一个语法分析器，产生与 `clang -cc1 -ast-dump=json` 相当的输出。注意，以下 log 省略了无关内容。

```bash
$ cat test/functional/000_main.sysu.c |
  clang -cc1 -I../sysu/include -E |
  clang -cc1 -ast-dump=json
{
  "id": "0x1c9b558",
  "kind": "TranslationUnitDecl",
  "loc": {},
  "range": {
    "begin": {},
    "end": {}
  },
  "inner": [
    { "commet": "原先第十行到第一百五十三行为内置类型，此处省略" },
    {
      "id": "0x1cdad18",
      "kind": "FunctionDecl",
      "loc": {
        "offset": 135,
        "file": "<stdin>",
        "line": 8,
        "presumedLine": 1,
        "col": 5,
        "tokLen": 4
      },
      "range": {
        "begin": {
          "offset": 131,
          "col": 1,
          "tokLen": 3
        },
        "end": {
          "offset": 157,
          "line": 10,
          "presumedLine": 3,
          "col": 1,
          "tokLen": 1
        }
      },
      "name": "main",
      "mangledName": "main",
      "type": {
        "qualType": "int ()"
      },
      "inner": [
        {
          "id": "0x1cdae30",
          "kind": "CompoundStmt",
          "range": {
            "begin": {
              "offset": 141,
              "line": 8,
              "presumedLine": 1,
              "col": 11,
              "tokLen": 1
            },
            "end": {
              "offset": 157,
              "line": 10,
              "presumedLine": 3,
              "col": 1,
              "tokLen": 1
            }
          },
          "inner": [
            {
              "id": "0x1cdae20",
              "kind": "ReturnStmt",
              "range": {
                "begin": {
                  "offset": 147,
                  "line": 9,
                  "presumedLine": 2,
                  "col": 5,
                  "tokLen": 6
                },
                "end": {
                  "offset": 154,
                  "col": 12,
                  "tokLen": 1
                }
              },
              "inner": [
                {
                  "id": "0x1cdae00",
                  "kind": "IntegerLiteral",
                  "range": {
                    "begin": {
                      "offset": 154,
                      "col": 12,
                      "tokLen": 1
                    },
                    "end": {
                      "offset": 154,
                      "col": 12,
                      "tokLen": 1
                    }
                  },
                  "type": {
                    "qualType": "int"
                  },
                  "valueCategory": "rvalue",
                  "value": "3"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
```

可以发现，`clang -cc1 -ast-dump=json` 输出一个 json 格式的语法分析树。本目录下提供了一个基于 bison + `llvm::json` 实现的模板，接受词法分析器的输出，你可以基于此继续实现完整的逻辑，也可以使用其他的工具实现，如 `antlr4`，但不得使用其提供的 C 语言模板；也不得使用任何封装好的库直接获得 ast，如 `libclang`。

## 评分规则

本实验的评分分为两部分：基础部分和扩展部分。

- 对于基础部分的实验，由低到高分别给出三档实验要求，并要求通过对应的自动评测。详见自动评测细则一节。
- 对于扩展部分的实验，你可以完成扩展方向一节的要求，也可以自行探索；如果可能，请同时编写对应的自动评测脚本。助教将按照你实现的难度给出评分。

如有疑问，参照 `clang -cc1 -ast-dump=json`。你需要提交一份实验报告，简要记录你的实验过程、遇到的难点以及解决的方法，并在报告中附上自动评测的结果。

### 自动评测细则

`make test` 包含了本次实验的评测项目 `parser-[0-3]`。`parser-0` 仅用于证明模板（代码与评测脚本）可以正确工作，不计入成绩；其他三个评测项依次检查详见[评测脚本](../test/test_parser.py)以了解检查算法，但不得修改评测逻辑而投机取巧。

### 扩展方向

本节给出一些扩展方向供参考。

1. 基于语法分析树实现一些语义分析，如
   - 检查是否有悬垂 else
   - 检查是否有 `const int` 作为数组大小（符合 SysY 语法和 CPP 语法但不符合 C 语法！）
   - 检查是否有全局函数先使用后定义（符合 C 语法但不符合 CPP 语法！）
   - 检查其他 SysY 语言的语义约束
   - Do what you want to do
2. 基于语法分析树实现一些优化，如
   - 常量折叠
   - 常量传播
   - 块间公共子表达式删除
   - 死代码删除
   - 提取循环无关语句到循环外
   - Do what you want to do
3. 基于语法分析树实现一些小工具，如
   - `sysu-formatter`：面向 SYsU 的代码格式化工具
   - `sysu-refactor`：面向 SYsU 的代码重构工具
     - 将输入代码的 `while (Cond) Simt` 替换为 `if (Cond) do Simt while (Cond)`
     - 或者相反！
   - Do what you want to do
4. 扩展更多 C 语言的语法。
5. 不借助 bison，并完全使用 SYsU 完成本实验，然后用它作为输入测试功能是否正确，以实现自举。
6. 借助 libclang 实现相同的功能。
7. 改进这个实验模板（欢迎 PR！）。
8. Do what you want to do。

## 你可能会感兴趣的

- [GNU Bison - The Yacc-compatible Parser Generator](https://www.gnu.org/software/bison/manual/)
- [llvm::json](https://github.com/llvm/llvm-project/blob/llvmorg-11.0.1/llvm/include/llvm/Support/JSON.h)
  - 该文件同样位于 debian:11 中 [llvm-dev](https://packages.debian.org/bullseye/amd64/llvm-dev) 包的 </usr/include/llvm/Support/JSON.h>。
