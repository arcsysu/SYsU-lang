# sysu-generator

## 实验描述

在本次 IR（中间代码）生成实验中，你被希望完成一个 IR 生成器，接受来自 `sysu-parser` 或 `clang -cc1 -ast-dump=json` 的语法树输入，产生 LLVM IR。预期的代码行数为 1500 行，预期的完成时间为 36 小时 ～ 108 小时。

```bash
$ ( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  clang -E tester/functional/000_main.sysu.c |
  clang -cc1 -O0 -S -emit-llvm )
; ModuleID = '-'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 3
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Debian clang version 11.0.1-2"}
```

注意，你的输出不必与 `clang -cc1 -O0 -S -emit-llvm` 完全相同，只要你的 LLVM IR 在经过编译后与其有相同的输出与返回值。

```bash
$ ( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  clang -E tester/functional/000_main.sysu.c |
  clang -cc1 -ast-dump=json |
  sysu-generator )
; ModuleID = '-'
source_filename = "-"

define i32 @main() {
entry:
  ret i32 3
}
```

至此一个初级的 SYsU 编译器就完成了！你可以使用 `lli` JIT 地执行编译出来的代码。

```bash
$ ( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  sysu-preprocessor tester/functional/000_main.sysu.c |
  sysu-lexer |
  sysu-parser |
  sysu-generator |
  lli --load=libsysy.so --load=libsysu.so ) # 该输出来自运行时库的计时统计
TOTAL: 0H-0M-0S-0us
$ echo $? # 在 Unix & Linux 中，可以通过 echo $? 来查看最后运行的命令的返回值对 256 取模后的结果。
3
```

如果你使用了来自 LLVM 的其他组件，你需要将其加入本目录下 `CMakeLists.txt` 中的 `llvm_map_components_to_libnames`，否则可能无法通过编译。你可以终端执行 `llvm-config --components`，查看所有的 LLVM 组件名称。然而，不得使用任何封装好的库从 C 语言源码直接获得 LLVM IR，如 `libclang`。

### 一些可能有用的小技巧：LLVM IR 可视化

你可以像这样，借助 `opt -dot-cfg` 选项，生成一个输入的 CFG 可视化。终端执行下述指令，将在目录下生成 `.main.dot` 文件，对应源代码中 `main` 函数的 CFG 图。

```bash
( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  clang -E tester/functional/027_if2.sysu.c |
  clang -cc1 -O0 -S -emit-llvm |
  opt -dot-cfg )
```

你可以将 `.main.dot` 中的内容复制到[这里](http://viz-js.com/)，在浏览器中查看其可视化。

## 评分规则

本实验的评分分为两部分：基础部分和挑战部分。

- 对于基础部分的实验，要求通过对应的自动评测，并**提交到[在线评测](https://arcsysu.github.io/SYsU-lang-archive-2022/)，在排行榜上有成绩**。详见自动评测细则一节。
- 对于挑战部分的实验，你可以完成挑战方向一节的要求，也可以自行探索；如果可能，请同时编写对应的自动评测脚本。助教将按照你实现的难度给出评分。

你需要提交一份实验报告，简要记录你的实验过程、遇到的难点以及解决的方法，并在报告中附上排行榜的上榜截图；助教会定期检查排行榜上的代码。本次实验仅要求功能完全正确，因此只要成功进入排行榜，本次实验即视为通过，排行榜上的成绩与性能对本次实验没有影响。

注意：你需要保证你的代码可以在[评测机环境](../Dockerfile)中正确工作。

### 自动评测细则

本次实验的评测项目为 `benchmark_generator_and_optimizer_[0-1]`。`benchmark_generator_and_optimizer_0` 仅用于证明模板（代码与评测脚本）可以正确工作，不计入成绩；其他评测项详见[评测脚本](../compiler/sysu-compiler)以了解检查算法，但不得修改评测逻辑而投机取巧。你也可以像这样调用评测脚本，单独执行其中的一个评测项。

```bash
( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  sysu-compiler --unittest=benchmark_generator_and_optimizer_1 "**/*.sysu.c" )
```

评测机单次评测总时限为一小时，评测时会将 `generator`、`optimizer` 目录以外的内容替换成本仓库中的内容，运行时长超过 2 分钟的编译结果会被跳过。因此本次实验中评测系统没有给出满分是正常的情况，助教的示例提交（基于 `clang -O0`）得分为 425/429，性能分约为 12.2%，评测花费了约二十五分钟。

此外，因为评测集群的并发量有限（至多可以同时评测十六份提交）。请大家先在本地测试通过所有非 `tester/third_party` 目录下的算例后再提交。

不要投机取巧，即使（可能）没有人在看着你。

## 挑战方向

本节给出一些挑战方向供参考。

1. 扩展更多 C 语言的语法。
2. 完全使用 SYsU 完成本实验，然后用它作为输入测试功能是否正确，以实现自举。
3. 借助 libclang 实现相同的功能。
4. 基于语法分析树实现一些优化，如
   - 死代码删除
   - 常量折叠
   - 常量传播
   - 块间公共子表达式删除
   - 提取循环无关语句到循环外
   - Do what you want to do
5. [107_long_code2.sysu.c](../tester/h_functional/107_long_code2.sysu.c) 这个算例在测试时直接使用 `clang` 导出的语法树大小为 8.9G，助教这里直接给出了[压缩后的语法树](../tester/h_functional/107_long_code2.json.gz)。然而由于 `llvm::json::parse` 的性能过弱，在服务器上运行了十五分钟才解析完（对比 python 的 `json.loads` 仅花费八秒）。你可以使用编译原理课程上学到的知识实现一个高性能的 json 渲染库，并与 [RapidJSON](https://github.com/Tencent/rapidjson) 等高性能的 json 库进行性能对比。
6. Do what you want to do

## 你可能会感兴趣的

- [Kaleidoscope: Code generation to LLVM IR](https://releases.llvm.org/11.0.1/docs/tutorial/MyFirstLanguageFrontend/LangImpl03.html)
- [SYsU-lang 实验三快速上手](https://www.yuque.com/shuitang/rra4fg/bnqy1c)
- [Viz.js — Graphviz in your browser.](http://viz-js.com/)
- [llvm::IRBuilder](https://github.com/llvm/llvm-project/blob/llvmorg-11.0.1/llvm/include/llvm/IR/IRBuilder.h)
  - 该文件同样位于 debian:11 中 [llvm-dev](https://packages.debian.org/bullseye/devel/llvm-dev) 包的 </usr/include/llvm/IR/IRBuilder.h>。
