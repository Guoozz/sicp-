(load "list.scm")
;;reverse
;;递归定义：空列表或只有1个元素的列表(也就是(cdr l)为null的
;;列表)reverse之后是表本身;大于1个元素的列表reverse之后为
;;(append(reverse (cdr l)) (cons  (car l) ()))

(define (reverse l)
  (if (or (null? l) (null? (cdr l)))
      l
      (append (reverse (cdr l)) (cons (car l) ())))
  )


;;迭代版本,从头开始构建一个新序列(cons (car items) c)c为列
;;表

(define (reverse-iter items)
  (define (iter c items)
    (if (null? items)
        c
        (iter (cons (car items) c) (cdr items))))
  (iter () items))
