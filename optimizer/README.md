# sysu-optimizer

## 实验描述

在本次 IR（中间代码）优化实验中，你被希望完成一个 IR 优化器，接受来自 `sysu-generator` 或 `clang -cc1 -O0 -S -emit-llvm` 的 LLVM IR，输出优化后的 LLVM IR。本实验为开放性实验，没有预期完成时间与代码行数。

```bash
( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  sysu-preprocessor tester/functional/000_main.sysu.c |
  sysu-lexer |
  sysu-parser |
  sysu-generator |
  sysu-optimizer )
# or
( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  clang -E tester/mizuno_ai/mizuno_ai.sysu.c |
  clang -cc1 -O0 -S -emit-llvm |
  opt -S --enable-new-pm -load-pass-plugin=libsysuOptimizer.so -passes="sysu-optimizer-pass" )
```

本目录下提供了一个基于 llvm pass manager 的模板，你可以基于此继续完成整个实验。以下是助教测试时运行时间超过两分钟的几个算例，你可以重点关注它们并进行优化：

- [dead-code-elimination-3.sysu.c](https://github.com/arcsysu/SYsU-lang-tester-perfermance/blob/latest/performance_test2021-private/dead-code-elimination-3.sysu.c)
- [hoist-3.sysu.c](https://github.com/arcsysu/SYsU-lang-tester-perfermance/blob/latest/performance_test2021-private/hoist-3.sysu.c)
- [integer-divide-optimization-2.sysu.c](https://github.com/arcsysu/SYsU-lang-tester-perfermance/blob/latest/performance_test2021-private/integer-divide-optimization-2.sysu.c)
- [integer-divide-optimization-3.sysu.c](https://github.com/arcsysu/SYsU-lang-tester-perfermance/blob/latest/performance_test2021-private/integer-divide-optimization-3.sysu.c)

以下算例由于语法树层级过多，编译器会在 `llvm::json::parse` 处产生瓶颈。实验中允许跳过该算例，但你被鼓励去解决这一问题。

- [107_long_code2.sysu.c](../tester/h_functional/107_long_code2.sysu.c)

以下是一些优化的方向供参考：

- 死代码删除
- 常量折叠
- 常量传播
- 块间公共子表达式删除
- 提取循环无关语句到循环外
- Do what you want to do

并思考，这些优化是否可以在语法树（即 `sysu-generator`）上完成？在这两个阶段各自的优点与缺点是什么？

如果你使用了来自 LLVM 的其他组件，你需要将其加入本目录下 `CMakeLists.txt` 中的 `llvm_map_components_to_libnames`，否则可能无法通过编译。你可以终端执行 `llvm-config --components`，查看所有的 LLVM 组件名称。然而，禁止使用任何 LLVM 自带的 [transform-passes](https://releases.llvm.org/11.0.1/docs/Passes.html#transform-passes)（当然，你被鼓励去学习这些 pass 的实现原理），助教会结合 `llvm-objdump` 等工具检查。

### Q & A：有关 new pass manager 与 legacy pass manager

Pass/PassManager 是 LLVM 里最重要的核心组件之一，自 LLVM 诞生以来已经有数十年历史。由于原有的 PM 编译效率低且错失很多优化机会，2014 年开始 LLVM 团队对其开始重构。在实验环境中使用的 LLVM-11.0.1 默认使用的仍然是旧 PM，但已经包含新 PM；在 LLVM-12 中已经默认使用 new pass manager 代替 legacy pass manager；在助教写下这段话的 2022 年 03 月 25 日，LLVM-14 正式发布，其 [ReleaseNotes](https://releases.llvm.org/14.0.0/docs/ReleaseNotes.html) 中提到：

> Using the legacy pass manager for the optimization pipeline is deprecated and will be removed after LLVM 14.

新 Pass 写起来更简单，不涉及虚函数等容易出问题的特性，只需要实现一个 `run` 函数；同时 Pass 的注册机制也更简单，是实现一个 `llvmGetPassPluginInfo` 而不是默认初始化一个对象。因此助教鼓励大家写新 Pass，模板也同样基于新 PM。然而网上很多学习资料（中文编程社区消息的滞后性加重了这一点）仍然基于旧 PM。[一般来说](https://www.zhihu.com/question/45051197/answer/290078011)：

> 1. CRTP 了 PassInfoMixin 的是 new Pass, 继承了 BasicBlockPass, LoopPass, RegionPass, FunctionPass, ModulePass 的这种是 legacy Pass.
> 2. 如果你看到 INITIALIZE_PASS_BEGIN, INITIALIZE_PASS_END 这种，则为 legacy Pass（我觉得似乎 `void initializeAddressSanitizerModulePass(PassRegistry&);` 这种也是 legacy Pass 的标志，但是我不是特别确认
> 3. 通常看到 SomethingWrapperPass, SomethingLegacyPass 这种一般是 legacy Pass(但是名字不是这样的也可能是 legacy Pass)

助教在文末附上了一些写新 Pass 的参考材料。

## 评分规则

本实验的评分分为两部分：基础部分和挑战部分。

- 对于基础部分的实验，要求通过对应的自动评测，并提交到[在线评测](https://arcsysu.github.io/SYsU-lang-archive-2022/)，在排行榜上有成绩，**并且在时限内通过上述四个算例**。详见自动评测细则一节。
- 由于本次基础部分的实验很难拿到满分，没有拿到满分的部分可使用前几个实验的挑战选项补充。需要在实验报告中提及所有的挑战工作。

你需要提交一份实验报告，简要记录你的实验过程、遇到的难点以及解决的方法，并在报告中附上排行榜的上榜截图；助教会定期检查排行榜上的代码。

注意：你需要保证你的代码可以在[评测机环境](../Dockerfile)中正确工作。

### 自动评测细则

本次实验的评测项目仍然为 `benchmark_generator_and_optimizer_[0-1]`。`benchmark_generator_and_optimizer_0` 仅用于证明模板（代码与评测脚本）可以正确工作，不计入成绩；其他评测项详见[评测脚本](../compiler/sysu-compiler)以了解检查算法，但不得修改评测逻辑而投机取巧。你也可以像这样调用评测脚本，单独执行其中的一个评测项。

```bash
( export PATH=$HOME/sysu/bin:$PATH \
  CPATH=$HOME/sysu/include:$CPATH \
  LIBRARY_PATH=$HOME/sysu/lib:$LIBRARY_PATH \
  LD_LIBRARY_PATH=$HOME/sysu/lib:$LD_LIBRARY_PATH &&
  sysu-compiler --unittest=benchmark_generator_and_optimizer_1 "**/*.sysu.c" )
```

评测时会通过 `clang -cc1 -O3 -S -emit-llvm` 得到用于对比的 LLVM IR；两份 IR 将同时通过 `clang -O0 -lsysy -lsysu` 编译成二进制可执行文件，执行并获得运行时间。单个评测项的性能分是两者运行时间的比值；总性能是各个性能项的几何平均。评测机单次评测总时限为一小时，评测时会将 `generator`、`optimizer` 目录以外的内容替换成本仓库中的内容，且运行时长超过 2 分钟的编译结果会被跳过。助教的示例提交（基于 `clang -O0`）得分为 425/429，性能分约为 12.2%，评测花费了约二十五分钟。

此外，因为评测集群的并发量有限（至多可以同时评测十六份提交）。请大家先在本地测试通过所有非 `tester/third_party` 目录下的算例后再提交。

不要投机取巧，即使（可能）没有人在看着你。

## 你可能会感兴趣的

- [Writing an LLVM Pass](https://releases.llvm.org/14.0.0/docs/WritingAnLLVMNewPMPass.html)
- [Using the New Pass Manager](https://releases.llvm.org/14.0.0/docs/NewPassManager.html)
- [Writing an LLVM Pass: 101 - LLVM 2019 tutorial](https://llvm.org/devmtg/2019-10/slides/Warzynski-WritingAnLLVMPass.pdf)
- [Writing LLVM Pass in 2018-part I](https://medium.com/@mshockwave/writing-llvm-pass-in-2018-part-i-531c700e85eb)
- [banach-space/llvm-tutor](https://github.com/banach-space/llvm-tutor)
