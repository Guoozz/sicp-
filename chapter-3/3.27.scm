(define mem-fib (memoize fib))
;; 通过简单的分析可知，fib是定义在全局环境里
;; (mem-fib n) 只会将fib(n)保存在表格里，而不会将递归过程中的值保存进去
;; 因此除非从0 - n-1 依次调用mem-fib 否则该过程依然是指数级
