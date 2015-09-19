(define (iterative-improve enough? improve)
  (lambda (x)
    (let ((next (improve x)))
      (if (enough? x next)
          x
          ((iterative-improve enough? improve) next)))))

(define (close-enough? guess next)
    (< (abs (- guess next)) 0.00001))

(define (fixed-point f guess)
  ((iterative-improve close-enough? f) guess))

(define (sqrt x)
  (define (average x y) (/ (+ x y) 2))
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
