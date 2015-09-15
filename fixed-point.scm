(load "common.scm")

(define (fixed-point f guess)
  (define (close-enough? guess next)
    (< (/ (abs (- guess next)) guess) 0.00001))
  (define (try-it guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          guess
          (try-it next))))
  (try-it guess))


(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
