(load "list.scm")
;;reverse
;;递归定义：空列表reverse之后是表本身;大于1个元素的列表reverse之后为
;;(append(reverse (cdr l)) (list (car l)))


;;有一点需要提一下，(append l1 l2) 若l1为空，那么结果就为l2,这样
;;就解决连接空列表的问题。
;;一个简单示例 (list 1 2 3 4 5)
;; (append (append (append (append (append null 5) 4) 3) 2) 1)
(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l))))
  )


;;迭代版本,从头开始构建一个新序列(cons (car items) c)c为列
;;表

(define (reverse-iter items)
  (define (iter c items)
    (if (null? items)
        c
        (iter (cons (car items) c) (cdr items))))
  (iter () items))
