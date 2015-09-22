(load "list.scm")

;;空表 最后一个元素是表本身;表非空 最后一个元素满足 (cdr l) = null ,同时也返回表本身。
(define (last-pair l)
  (if (or (null? l) (null? (cdr l)))
      l
      (last-pair (cdr l))))
