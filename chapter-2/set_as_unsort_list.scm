;; 集合用未排序的表表示

(define (element-of-set? x set)
  (if (null? set)
      false
      (if (equal? x (car set))
          true
          (element-of-set? x (cdr set)))))
