# sysu-lexer

## 实验描述

本次词法分析实验中，你被希望完成一个词法分析器，输出与 `clang -cc1 -dump-tokens` 一致的内容。

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

可以发现，`clang -cc1 -dump-tokens` 输出的每一行包含：

1. （一个）有效 token。
2. （一个）由单引号包裹的匹配串。
3. （若干）识别上一个有效 token 到这个有效 token 间遇到的无效 token。
4. （一个）有效 token 的位置。

本目录下提供了一个基于 flex 实现的模板，你可以基于此继续实现完整的逻辑，也可以使用其他的工具实现，如 `antlr4`，但不得使用其提供的 C 语言模板；也不得使用任何封装好的库直接获得 token，如 `libclang`。

## 评分规则

本实验的评分分为两部分：基础部分和扩展部分。

- 对于基础部分的实验，由低到高分别给出三档实验要求，并要求通过对应的自动评测。详见自动评测细则一节。
- 对于扩展部分的实验，你可以完成扩展方向一节的要求，也可以自行探索；如果可能，请同时编写对应的自动评测脚本。助教将按照你实现的难度给出评分。

如有疑问，参照 `clang -cc1 -dump-tokens`。你需要提交一份实验报告，简要记录你的实验过程、遇到的难点以及解决的方法，并在报告中附上自动评测的结果。

### 自动评测细则

`make test` 包含了本次实验的评测项目 `lexer-[0-3]`。`lexer-0` 仅用于证明模板（代码与评测脚本）可以正确工作，不计入成绩；其他三个评测项依次检查：

1. `sysu-lexer` 是否提取出正确的 token（60 分）。
2. `sysu-lexer` 是否提取出正确的 token location（30 分）。
3. `sysu-lexer` 是否识别其他无关字符（10 分）。

评测脚本忽略空白符，可以查看[评测脚本](../test/test_lexer.py)以了解检查算法，但不得修改评测逻辑而投机取巧。

### 扩展方向

本节给出一些扩展方向供参考。

1. 扩展更多 C 语言的 token。
2. 不借助 flex，并完全使用 SYsU 完成本实验，然后用它作为输入测试功能是否正确，以实现自举。
   - 提示：如果你不知道如何下手的话，仔细回忆老师上课所讲的内容，尤其是**正则文法与有限自动机（FA）的等价性**！
3. 借助 libclang 实现相同的功能。
4. 改进这个实验模板（欢迎 PR！）。
5. Do what you want to do。

## 你可能会感兴趣的

- [Lexical Analysis With Flex](http://westes.github.io/flex/manual/)
- [这篇博客](https://wu-kan.cn/2020/05/14/%E4%BD%BF%E7%94%A8%E8%AF%8D%E6%B3%95%E5%88%86%E6%9E%90%E5%99%A8-Flex-%E6%8F%90%E5%8F%96%E7%A8%8B%E5%BA%8F%E4%B8%AD%E7%9A%84%E6%95%B4%E6%95%B0%E5%92%8C%E6%B5%AE%E7%82%B9%E6%95%B0/)提到了一种处理注释的方案，如果你不想使用 [flex 自带的注释处理方法](http://westes.github.io/flex/manual/Comments-in-the-Input.html)。
- [这篇博客](https://wu-kan.cn/2020/07/03/%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F%E5%85%B3%E7%B3%BB%E5%88%A4%E5%AE%9A/)通过构造有限自动机，判断两个正则表达式的关系。
