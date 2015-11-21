;; 该过程实现对list的翻转

(define (reverse-list l)
  (define (iter unvisit visited)
    (if (null? l)
        visited
        (let ((temp (cdr unvisit)))
          (set-cdr! unvisit visited)
          (iter temp unvisit))))
  (iter l '()))

(define (deep-reverse-list l)
  (define (iter unvisit visited)
    (cond ((null? unvisit) visited)
          ((not (pair? unvisit)) '())
          ((pair? unvisit) (let ((temp (cdr unvisit)))
                       (set-cdr! unvisit visited)
                       (append (iter temp unvisit) (list (iter (car unvisit) '())))))))
  (iter l '()))



(define (reverse l)
  (cond ((null? l) l)
        ((not (pair? l)) l)
        ((pair? l) (append (reverse (cdr l)) (cons (reverse (car l)) '())))))
