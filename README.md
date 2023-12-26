# 基于VHDL语言的24进制多功能数字钟
## HAUT大三上EDA技术课程设计
### 安装要求
本项目采用QuartusII9.0版本设计，非9.0版本打开可能会存在兼容性问题。
### 设计任务
设计一个24进制多功能数字电子钟，要求具备以下功能：
（1）时钟显示：能够以十进制在7段数码管上显示“时”、“分”、“秒”、“十分之一秒”。
（2）校表功能：能够对时钟进行校正。
（3）启动/暂停功能：能够控制时钟的启动和暂停。
（4）一键清零功能：能够将时钟清零。
（5）整点报时功能：能够在整点时发出报时信号。
（6）闹钟功能：能够在设置的时间到达时发出闹钟信号。
#### 顶层设计原理图如下：
![image](https://github.com/Luxiyu/VHDL_digital_clock/blob/main/IMAGE/原理图.png)
### 设计方案/设计原理及总体框图
#### 设计实现思路：
（1）计时功能。计时功能主要由四个计数器模块共同构成，其中十分之一秒计时器为十进制计数、分，秒计时器为六十进制计数、小时计时器为二十四进制计数。计时器之间采用进位信号进行串联。
（2）十进制7端数码管显示功能。显示功能由译码器模块实现。译码器模块的两个输入端分别为刷新端和数据端。七个译码器的刷新端连接十分之一秒的周期脉冲信号。而数据端连接计数器的输出端，用以将4位输出BCD码译码为7端数码管的七位显示信号。
（3）校表功能。校表功能由二选一模块和校时模式选择器模块构成。其中二选一模块用于连接下一级计时器模块的进位信号和手动按钮脉冲信号。当控制信号为“0”时，二选一模块输出计时器模块的进位信号。而当控制信号为“1”时，二选一模块输出手动按钮信号。控制信号由校时模式选择器模块输出，校时模式选择器输出端连接着“秒进分”和“分进时”的二选一模块。单无输入信号时校时模式选择器两个输出端均为“0”，给校时模式选择器模块输入端一个脉冲后，校时模式选择器的“秒进分”控制信号输出端为“1”，“分进时”控制信号输出端为“0”。再给校时模式选择器模块输入一个脉冲后，校时模式选择器的“秒进分”控制信号输出端为“0”， 校时模式选择选择器的“分进时”控制信号输出端为“1”。总结，校表功能的输入端为两个按钮，按钮一用于控制校时或者校分，按钮二用于控制时或分进行加一操作。
（4）启动暂停功能。电子钟的启停功能由一个启动/停止模块和四个计时器模块构成。启动/停止模块默认输出“0”，在给予启动/停止模块一个脉冲后模块输出“1”即将输出信号进行反转操作。每给予启动/停止模块一个脉冲后输出段信号就进行一次反转。启动/停止模块的输出端连接至四个计时器模块的使能端。计时器模块在使能端为“1”时正常工作，在使能端为“0”时暂停，不对输入进位信号产生反应。
（5）一键清零功能。四个计时器模块具有一键清零端口，当清零端口为“1”时，计时器模块的内部计数值清零。
（6）整点报时功能。设置闹铃模块，闹铃模块的输入端将会连接“分信号”和“秒信号”。当“分信号”为59时，并且“秒信号”十位为5，“秒信号”的个位为5、7、9时产生一秒的闹铃信号。即在每一个整点前的55，57，59三秒进行闹铃，完成整点报时功能。
（7）闹钟功能。闹铃模块还具备四个输入端，分别接受设置的“时”的个十位，以及“分”的个十位。闹铃模块会对设置信号和输入的真实信号进行比对处理。当检测到时间和设置闹铃时间一致时，在到达闹铃时间后的十秒内产生两端长闹铃信号。
#### 总体框图
![image](https://github.com/Luxiyu/VHDL_digital_clock/blob/main/IMAGE/设计逻辑框图.png)
### 顶层设计仿真

