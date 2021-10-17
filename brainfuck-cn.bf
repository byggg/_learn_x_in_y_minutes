
除"><+-.,[]"之外的的任何字符都会被忽略 (不包含双引号)。

Brainfuck 包含一个有30,000个单元为0的数组，和
一个数据指针指向当前的单元。

8个指令如下:
+ : 指针指向的单元的值加1
- : 指针指向的单元的值减1
> : 将指针移动到下一个单元(右边的元素)
< : 将指针移动到上一个单元(左边的元素)
. : 打印当前单元的内容的ASCII值 (比如 65 = 'A').
, : 读取一个字符到当前的单元
[ : 如果当前单元的值是0，则向后调转到对应的]处
] : 如果当前单元的值不是0，则向前跳转到对应的[处

[ 和 ] 组成了一个while循环。很明显，它们必须配对。

让我们看一些基本的brainfuck 程序。

++++++ [ > ++++++++++ < - ] > +++++ .

这个程序打印字母'A'。首先，它把 #1 增加到6，使用它来作为循环条件，
然后，进入循环，将指针移动到 #2 ，将 #2 的值增加到10，然后
移动回 #1，将单元 #1 的值减1，然后继续。循环共进行了6次。

这时，我们在 #1，它的值为0，#2 的值为60，我们移动到
#2，将 #2 的内容加上5，然后将 #2 的内容打印出来，65在
ASCII中表示'A', 所以'A'就会被打印出来。


, [ > + < - ] > .

这个程序从用户的输入中读取一个字符，然后把它复制到 #1。
然后我们开始一个循环，移动到 #2，将 #2 的值加1，再移动回 #1，将 #1
的值减1，直到 #1的值为0，这样 #2 里就保存了 #1 的旧值，循环结束时我们
在 #1，这时我们移动到 #2，然后把字符以ASCII打印出来。

而且要记住的一点就是，空格在这里只是为了可读性，你可以将他们写成这样:

,[>+<-]>.

试着思考一下这段程序是干什么的:

,>,< [ > [ >+ >+ << -] >> [- << + >>] <<< -] >>

这段程序从输入接收2个参数，然后将他们相乘。

先读取2个输入，然后开始外层循环，以 #1 作为终止条件，然后将指针移动到
#2，然后开始 #2 的内层循环，将 #3 加1。但是这里有一个小问题，在内层
循环结束的时候，#2 的值是0了，那么下次执行外层循环的时候，就有问题了。
为了解决这个问题，我们可以增加 #4 的值，然后把 #4 的值复制到 #2，
最后结果就保存在 #3 中了。

