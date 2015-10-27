### 关于习题**2.86**

-------------------------------------------------------------------------------
这个问题解决的办法不是很困难,除了内置型(scheme-number)数据外,其他数据类型的运算都要采用通用型计算过程,例如 x,y 为复数那么

``` scheme
(define (add-complex x y)
 (make-from-real-imag (add (real-part x)
                           (real-part y))
                      (add (imag-part x)
                           (imag-part y))))
```

其中add为通用计算过程
