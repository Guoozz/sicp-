;;迭代版本
(define (product-iter a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

;;递归版本
(define (product a b term next)
  (if (> a b)
      1
      (* (term a) (product (next a) b term next))))

;;阶乘
(define (factorial n)
  (define (term x) x)
  (define (next x) (+ x 1))
  (product 1 n term next))


;;Wallis product 参考 https://www.wikiwand.com/en/Wallis_product
(define (Wallis-product a b)
  (define (term n)
    (* (/ (* 2 n)
          (- (* 2 n) 1))
       (/ (* 2 n)
          (+ (* 2 n) 1))))
  (define (next n)
    (+ n 1))
  (* 2.0 (product-iter a b term next)))
