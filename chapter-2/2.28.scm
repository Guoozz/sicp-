(load "list.scm")
(define nil ())
;;fringe 将一棵树的树叶以表的形式就行保存
;;递归

(define (fringe tree)
  (if (null? tree)
      nil
      (if (pair? tree)
          (append (fringe (car tree)) (fringe (cdr tree)))
          (list tree)
          )))
