;;求a的n次幂
(define (expond a n)
  (define (even? x) (= (remainder x 2) 0))
  (define (square x) (* x x))
  (if (= n 0)
      1
      (if (even? n)
          (square (expond a (/ n 2)))
          (* a (expond a (- n 1))))))

;;幂运算取模
(define (exp-mod base exp m)
  (remainder (expond base exp) m))

;;费马小定理检测素数
(define (fermat-test n)
  (define (try-it a)
    (= (exp-mod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

;;多次检测（次数越多，对素数的判定越准确）
(define (prime? n)
  (define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))
  (fast-prime? n 10))
