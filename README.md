# SYsU-lang

SYsU 是一个教学语言，应用于中山大学（**S**un **Y**at-**s**en **U**niversity）[编译原理课程](https://xianweiz.github.io/teach/dcs290/s2022.html)的教学。本项目是该课程的实验模板，可以得到一个 SYsU language 的编译器组件。实验的设计目标是：

1. 在兼容 [SysY](https://gitlab.eduxiji.net/nscscc/compiler2021/-/blob/master/SysY%E8%AF%AD%E8%A8%80%E5%AE%9A%E4%B9%89.pdf) 语言的基础上，增加最少的语法支持，使其可以编译 [Yat-sen OS](https://github.com/NelsonCheung-cn/yatsenos-riscv)。
2. 编译器设计借鉴 clang。换言之，在学习的前期，实验产物与 clang 类似甚至可以直接导入 LLVM 工具链；在实验的后期逐步去除外部依赖，使其可以自举。
3. 按照自顶向下的顺序进行实验，各个实验模块之间可通过管道进行通信（微 内 核）。
4. 基于 Github Action 的自动化评测

同样欢迎其他高校相关课程使用！

## 语法特征

SYsU 是 C 语言的子集，同时也是 [SysY](https://gitlab.eduxiji.net/nscscc/compiler2021/-/blob/master/SysY%E8%AF%AD%E8%A8%80%E5%AE%9A%E4%B9%89.pdf) 语言的超集，在后者的基础上进行了一些调整，以适应课程需要：

1. 源代码后缀名由 `.sy` 调整为 `.sysu.c`。
2. 运行时库由 `libsysy.so` 和 `libsysy.a` 调整为 `libsylib.so` 和 `libsylib_static.a`。
3. 元素类型增加 `char`。
4. 常量类型增加字符串常量。注意，并不支持字符常量，而应当用字符串常量与下标寻址表示（如`"c"[0]`）。
5. 语句类型增加 `do` - `while` 循环。
6. 运行时库提供的函数需要预先 `#include`。
7. 源代码通过**预处理器**（如 `clang -cc1 -E`）处理后传给**编译器**。
8. 待补充

## 编译运行

需要注意的是，[SysY](https://gitlab.eduxiji.net/nscscc/compiler2021/-/blob/master/SysY%E8%AF%AD%E8%A8%80%E5%AE%9A%E4%B9%89.pdf) 语言允许编译时能够求值的 `const int` 作为数组大小，导致部分算例不能通过 `gcc` 的编译，因此为保持兼容本项目推荐使用 `clang` 编译，本地版本为 `clang-11`，操作系统为 `debian:11`（对于使用其他操作系统的同学，建议使用 [docker](https://hub.docker.com/_/debian)）。

```bash
# 安装依赖
sudo apt install \
    ninja-build cmake zlib1g-dev \
    gzip flex bison \
    clang libclang-dev llvm-dev \
    python3 python3-tqdm

# 编译，假设你已经在这个目录下
rm -rf ../sysu
cmake -G Ninja \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_INSTALL_PREFIX=../sysu \
  -B ../sysu/build
cmake --build ../sysu/build
cmake --install ../sysu/build

# 检查各实验的得分
( cd ../sysu/build &&
  ctest --output-on-failure )

# 检查编译结果
( PATH=../sysu/bin:$PATH &&
  cat test/functional/000_main.sysu.c |
  clang -cc1 -I../sysu/include -E |
  sysu-lexer )
```

## 代码结构

### `lexer`

SYsU 的词法分析器，产生类似于 `clang -cc1 -dump-tokens` 的输出。作为词法分析实验模块，本仓库中的 `sysu-lexer` 并不能处理完整的 SYsU，但提供了一个模板，需要学生将其词法规则补充完整（[详细实验要求](lexer/README.md)）。

```bash
$ ( PATH=../sysu/bin:$PATH &&
  cat test/functional/000_main.sysu.c |
  clang -cc1 -I../sysu/include -E |
  sysu-lexer )
int 'int'               Loc=<<stdin>:1:1>
identifier 'main'               Loc=<<stdin>:1:5>
l_paren '('             Loc=<<stdin>:1:9>
r_paren ')'             Loc=<<stdin>:1:10>
l_brace '{'             Loc=<<stdin>:1:11>
return 'return'         Loc=<<stdin>:2:5>
numeric_constant '3'            Loc=<<stdin>:2:12>
semi ';'                Loc=<<stdin>:2:13>
r_brace '}'             Loc=<<stdin>:3:1>
eof ''          Loc=<<stdin>:4:1>
```

可以对比一下 `clang -cc1 -dump-tokens` 的结果。

```bash
$ cat test/functional/000_main.sysu.c |
  clang -cc1 -I../sysu/include -E |
  clang -cc1 -dump-tokens
int 'int'        [StartOfLine]  Loc=<<stdin>:1:1>
identifier 'main'        [LeadingSpace] Loc=<<stdin>:1:5>
l_paren '('             Loc=<<stdin>:1:9>
r_paren ')'             Loc=<<stdin>:1:10>
l_brace '{'             Loc=<<stdin>:1:11>
return 'return'  [StartOfLine] [LeadingSpace]   Loc=<<stdin>:2:5>
numeric_constant '3'     [LeadingSpace] Loc=<<stdin>:2:12>
semi ';'                Loc=<<stdin>:2:13>
r_brace '}'      [StartOfLine]  Loc=<<stdin>:3:1>
eof ''          Loc=<<stdin>:3:2>
```

### `parser`

SYsU 的语法分析器，接受来自 `sysu-lexer` 的输入，输出一个 json 格式的语法分析树（类似于 `clang -cc1 -ast-dump=json`）。作为语法分析实验模块，本仓库中的 `sysu-parser` 并不能处理完整的 SYsU，但提供了一个模板，需要学生将其词法规则补充完整（[详细实验要求](parser/README.md)）。

```bash
$ ( PATH=../sysu/bin:$PATH &&
  cat test/functional/000_main.sysu.c |
  clang -cc1 -I../sysu/include -E |
  sysu-lexer 2>&1 |
  sysu-parser )
{
  "inner": [
    {
      "inner": [
        {
          "inner": [
            {
              "inner": [
                {
                  "kind": "IntegerLiteral",
                  "value": "3"
                }
              ],
              "kind": "ReturnStmt"
            }
          ],
          "kind": "CompoundStmt"
        }
      ],
      "kind": "FunctionDecl",
      "name": "main"
    }
  ],
  "kind": "TranslationUnitDecl"
}
```

当然，也可以直接从 `clang -cc1 -dump-tokens` 获得输入。

```bash
( PATH=../sysu/bin:$PATH &&
  cat test/functional/000_main.sysu.c |
  clang -cc1 -I../sysu/include -E |
  clang -cc1 -dump-tokens 2>&1 |
  sysu-parser )
```

### `generator`

`sysu-generator` 将 `sysu-parser` 得到的语法分析树转换为 LLVM IR。作为代码生成实验模块，本仓库中的 `sysu-generator` 并不能处理完整的 SYsU，但提供了一个模板，需要学生将其语法规则补充完整（[详细实验要求](generator/README.md)）。

```bash
$ ( PATH=../sysu/bin:$PATH &&
  cat test/functional/000_main.sysu.c |
  clang -cc1 -I../sysu/include -E |
  sysu-lexer 2>&1 |
  sysu-parser |
  sysu-generator )
; ModuleID = '-'
source_filename = "-"

define i32 @main() {
entry:
  ret i32 3
}
```

至此一个初级的 SYsU 编译器就完成了！你可以使用 `lli` JIT 地执行编译出来的代码。

### `optimizer`

`sysu-optimizer` 接受 `sysu-generator` 的输出，完成一些优化 Pass：

1. 常量折叠
2. 常量传播
3. 块间公共子表达式删除
4. 待补充

并思考，是否可以在语义分析时完成？在这两个阶段各自的优点与缺点是什么？

### `sylib`

运行时库 `libsylib`。

### `test`

目录下提供了一系列 SYsU 格式的测试代码以及对应程序的输入输出，修改自 [nscscc/compiler2021](https://gitlab.eduxiji.net/nscscc/compiler2021/) 中提供的算例。

### `.github`

github action，保存 CI 自动化配置文件。

## 实验反馈

- 交流实验中遇到的困难：[![Discussions](https://img.shields.io/github/discussions/arcsysu/SYsU-lang)](https://github.com/arcsysu/SYsU-lang/discussions)
- 提出实验设计的问题：[![Issues](https://img.shields.io/github/issues/arcsysu/SYsU-lang)](https://github.com/arcsysu/SYsU-lang/issues)
- 改善这个实验：[![Issues-pr](https://img.shields.io/github/issues-pr/arcsysu/SYsU-lang)](https://github.com/arcsysu/SYsU-lang/pulls)

## 你可能会感兴趣的

- [2021 编译系统设计赛（华为毕昇杯）](https://compiler.educg.net/2021CSCC)
  - 可找到各参赛学校的开源代码
- 其它基于 [SysY](<(https://gitlab.eduxiji.net/nscscc/compiler2021/-/blob/master/SysY%E8%AF%AD%E8%A8%80%E5%AE%9A%E4%B9%89.pdf)>) 语法设计的编译器实验
  - [miniSysY 编译实验](https://buaa-se-compiling.github.io/miniSysY-tutorial/)
  - [Komorebi660/SysYF-Compiler](https://github.com/Komorebi660/SysYF-Compiler)
