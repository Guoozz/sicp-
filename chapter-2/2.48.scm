(load "2.46.scm")

(define (make-segment start-vect end-vect)
  (cons start-vect end-vect))

(define (start-segment l)
  (car l))

(define (end-segment l)
  (cdr l))
