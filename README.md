# VLOCInterpreter

VLOCInterpreter 是一个Object-C 语言的动态化框架，此解释器采用OC语言的.m 文件作为输入源代码，主要架构分为两个部分。
前端是VLOCLanguage 语法解释器，生成中间代码  ，VLOC language 最大限度采用OC 语法，所以我们可以直接用.m 文件作为输入。
后端是VLOC虚拟机，针对中间代码在OC运行环境，进行运行。

具体技术原理请参考我的博客。
