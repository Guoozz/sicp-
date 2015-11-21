;; 判断一个表是否包含环

(define (circle-list? l)
  (define (iter rest visited-set)
    (cond ((null? rest) false)
          ((pair? (car rest)) (and (iter (car rest) '()) (iter (cdr rest) (adjoin (cdr rest) visited-set))))
          ((in-set? (cdr rest) visited-set) true)
          (else (iter (cdr rest) (adjoin (cdr rest) visited-set)))))
  (iter l '()))

(define (in-set? x l)
  (cond ((null? l) false)
        ((eq? (car l) x) true)
        (else (in-set? x (cdr l)))))

(define (adjoin item set)
  (cons item set))
