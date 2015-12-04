;; 求两个集合的合集

(define (union-set set1 set2)
  (define (iter s1 s2 result)
    (cond ((null? s1) (append result s2))
          ((null? s2) (append result s1))
          (else (let ((x1 (car s1))
                      (x2 (car s2)))
                  (cond ((= x1 x2) (iter (cdr s1) (cdr s2) (append result (list x1))))
                        ((> x1 x2) (iter s1 (cdr s2) (append result (list x2))))
                        (else (iter (cdr s1) s2 (append result (list x1)))))))))
  (iter set1 set2 '()))
