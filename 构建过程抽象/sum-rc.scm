;; 定义一个通用的求和过程

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next  b))))


;; term = x 的求和过程

(define (sum-x a b)
  (define (term x) x)
  (define (next x) (+ x 1))
  (sum term a next b))

(define (cube x) (* x x x))
(define (cube-term x) (cube x))
(define (cube-next x) (+ x 1))

(define (cube-sum a b)
  (sum cube-term a cube-next b))
