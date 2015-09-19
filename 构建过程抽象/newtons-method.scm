(load "fixed-point.scm")

(define (deriv g)
  (define dx 0.00001)
  (lambda (x) (/ (- (g (+ x dx)) (g x))
                 dx)))

(define (newtow-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))


(define (newtons-method g guess)
  (fixed-point (newtow-transform g) guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                 1.0))
