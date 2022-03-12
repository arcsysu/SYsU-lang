# sysu-generator

## 扩展方向

本节给出一些扩展方向供参考。

1. 扩展更多 C 语言的语法。
2. 不借助 bison，并完全使用 SYsU 完成本实验，然后用它作为输入测试功能是否正确，以实现自举。
3. 借助 libclang 实现相同的功能。
4. 基于语法分析树实现一些优化，如
   - 常量折叠
   - 常量传播
   - 块间公共子表达式删除
   - 死代码删除
   - 提取循环无关语句到循环外
   - Do what you want to do

## 你可能会感兴趣的

- [Kaleidoscope: Code generation to LLVM IR](https://releases.llvm.org/11.0.1/docs/tutorial/MyFirstLanguageFrontend/LangImpl03.html)
