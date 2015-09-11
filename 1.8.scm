(define (square x) (* x x))

(define (abs x) (if (< x 0) (- x) x))

(define (good-enough? old-guess new-guess) (< (/ (abs (- new-guess old-guess) ) old-guess) 0.01))

(define (average x y) (/ (+ x y ) 2))


(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)
   ))
 
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (cube-root x)
  (cube-root-iter 1.0 x))


;;利用牛顿迭代法求立方根
(define (cube-root.improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root-iter guess x)
  (if (good-enough? guess (cube-root.improve guess x))
      guess
      (cube-root-iter (cube-root.improve guess x) x)))
