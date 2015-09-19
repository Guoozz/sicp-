(define (expmod a n m)
  (define (even? x) (= (remainder x 2) 0))
  (define (square x) (* x x))
  (if (= n 0)
      1
      (if (even? n)
          (remainder (square (expmod a (/ n 2) m)) m)
          (remainder (* (remainder a m) (expmod a (- n 1) m)) m))))

(define (ferma-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n)
  (define (fast-prime? n times)
    (cond ((= times 0) true)
          ((ferma-test n) (fast-prime? n (- times 1)))
          (else false)))
  (fast-prime? n 10))
