(load "1.42.scm")

(define dx 0.00001)
(define (average f1 f2 f3)
  (lambda (x) (/ (+ f1 f2 f3) 3)))

(define (smooth f)
  (lambda (x) (average (f (- x dx))
                       (f x) (f (+ x dx)))))
(define (smooth-n f n)
  (repeate (smooth f) n))
