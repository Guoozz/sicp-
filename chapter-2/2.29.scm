(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch x)
  (car x))

(define (right-branch x)
  (car (cdr x)))

(define (branch-length x)
  (car x))

(define (branch-structure x)
  (car (cdr x)))

(define (total-weight x)
  (if (null? x)
      0
      (if (pair? x)
          (+ (total-weight (branch-structure (left-branch x)))
             (total-weight (branch-structure (right-branch x))))
          x)))
