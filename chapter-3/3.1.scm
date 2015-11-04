(define (make-accumulator init)
  (lambda (x) (begin (set! init (+ init x)) init)))
