# sysu-optimizer

`sysu-optimizer` 接受 `sysu-generator` 的输出，完成一些优化 Pass：

1. 常量折叠
2. 常量传播
3. 块间公共子表达式删除
4. Do what you want to do

并思考，是否可以在语义分析时完成？在这两个阶段各自的优点与缺点是什么？

```bash
( export PATH=~/sysu/bin:$PATH \
  CPATH=~/sysu/include:$CPATH \
  LD_LIBRARY_PATH=~/sysu/lib:$LD_LIBRARY_PATH &&
  sysu-preprocessor tester/functional/000_main.sysu.c |
  sysu-lexer |
  sysu-parser |
  sysu-generator |
  sysu-optimizer )
# or
( export PATH=~/sysu/bin:$PATH \
  CPATH=~/sysu/include:$CPATH \
  LD_LIBRARY_PATH=~/sysu/lib:$LD_LIBRARY_PATH &&
  clang -E tester/mizuno_ai/mizuno_ai.sysu.c |
  clang -cc1 -S -emit-llvm |
  opt -S --enable-new-pm -load-pass-plugin=libsysu-optimizer-plugin.so -passes="sysu-optimizer-pass" )
```

## 你可能会感兴趣的

- [Writing an LLVM Pass](https://releases.llvm.org/13.0.1/docs/WritingAnLLVMNewPMPass.html)
- [Using the New Pass Manager](https://releases.llvm.org/13.0.1/docs/NewPassManager.html)
- [Writing an LLVM Pass: 101 - LLVM 2019 tutorial](https://llvm.org/devmtg/2019-10/slides/Warzynski-WritingAnLLVMPass.pdf)
- [Writing LLVM Pass in 2018-part I](https://medium.com/@mshockwave/writing-llvm-pass-in-2018-part-i-531c700e85eb)
- [banach-space/llvm-tutor](https://github.com/banach-space/llvm-tutor)
