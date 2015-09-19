(load "divisor-prime.scm")

(define (filtered-accumulate combiner filter null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
        (combiner null-value (filtered-accumulate combiner filter null-value term (next a) next b)))
        (else (combiner (term a) (filtered-accumulate combiner filter null-value term (next a) next b)))))

;;迭代版本 利用不变式 sum = c + x1 + x2 +...+ xn =(c + x1) + x2 + x3 + ... + xn c保存中间结果
;;写出来用了5分钟，找Bug（括号加错,filter写成fileter）用了40分钟
(define (filtered-accumulate-iter combiner filter null-value term a next b)
  (define (iter c a)
     (if (> a b)
         c
         (if (filter a)
             (iter (combiner c null-value) (next a))
             (iter (combiner c (term a)) (next a)))))
  (iter null-value a))

(define (sum term filter a next b)
  (define (combiner x y)
    (+ x y))
  (filtered-accumulate-iter combiner filter 0 term a next b))

(define (sum-prime a b)
  (sum (lambda (x) x)
       (lambda (x) (if (prime? x) false true))
       a
       (lambda (x) (+ x 1))
       b))

;;计算最大公约数
(define (gcd a b)
  (if (< a b)
      (gcd b a)
      (if (= b 0) a
          (gcd b (remainder a b)))))

(define (product term filter a next b)
  (filtered-accumulate (lambda (x y) (* x y))
                            filter 1 term a next b))

(define (product-gcd n)
  (product (lambda (x) x)
           (lambda (x) (if (= (gcd x n) 1)
                       false
                       true))
           1
           (lambda (x) (+ x 1))
           (- n 1)))
