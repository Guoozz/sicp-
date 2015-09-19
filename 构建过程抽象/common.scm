(define (abs x)
  (if (< x 0) (- x) x))

(define (cube x) (* x x x))

(define (average x y) (/ (+ x y) 2))

(define (even? n) (= (remainder n 2) 0))
