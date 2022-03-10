# sysu-optimizer

```bash
( export PATH=~/sysu/bin:$PATH CPATH=~/sysu/include:$CPATH &&
  sysu-preprocessor tester/functional/000_main.sysu.c |
  sysu-lexer 2>&1 |
  sysu-parser |
  sysu-generator |
  LD_LIBRARY_PATH+=$HOME/sysu/lib sysu-optimizer --help) # 暂时不work，待fix
# or
( export PATH=~/sysu/bin:$PATH CPATH=~/sysu/include:$CPATH &&
  sysu-preprocessor tester/mizuno_ai/mizuno_ai.sysu.c |
  clang -cc1 -S -emit-llvm |
  opt --enable-new-pm -load-pass-plugin=$HOME/sysu/lib/libsysu-optimizer-plugin.so -passes="print<static-cc>" -disable-output)
```

## 你可能会感兴趣的

- [Writing an LLVM Pass](https://releases.llvm.org/13.0.1/docs/WritingAnLLVMNewPMPass.html)
- [Using the New Pass Manager](https://releases.llvm.org/13.0.1/docs/NewPassManager.html)
- [Writing an LLVM Pass: 101 - LLVM 2019 tutorial](https://llvm.org/devmtg/2019-10/slides/Warzynski-WritingAnLLVMPass.pdf)
- [Writing LLVM Pass in 2018-part I](https://medium.com/@mshockwave/writing-llvm-pass-in-2018-part-i-531c700e85eb)
- [banach-space/llvm-tutor](https://github.com/banach-space/llvm-tutor)
