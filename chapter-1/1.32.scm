;; 递归版本
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term
                                     (next a) next  b))))
;; 迭代版本
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

;;定义累加

(define (sum term a next b)
  (define (combiner x y)
    (+ x y))
  (accumulate-iter combiner 0 term a next b))

;;定义累乘

(define (product term a next b)
  (define (combiner x y)
    (* x y))
  (accumulate-iter combiner 1 term a next b))

;;进行测试
(define (inc x) (+ x 1))
(define (f x) x)
(define (sum-add a  b)
  (sum f a inc b))
(define (factorial n)
  (product f 1 inc n))
