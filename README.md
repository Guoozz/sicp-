#关于SICP的SICP

### 1. 浅谈递归和迭代
####什么是递归？
我们先从一个简单的例子说起，数学里阶乘是这样定义的：

> ![frac](/home/guoo/Picture/frac.png)

根据定义可以写出阶乘的scheme代码
>(define (fac n)
    (if (= n 1) 1 (* n (f (- n 1)))))
