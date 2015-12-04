;;集合作为排序的表
(define (element-of-set? x set)
  (cond ((or (null? set)
             (< x (car set))) false)
        ((= x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (cons x set))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))
