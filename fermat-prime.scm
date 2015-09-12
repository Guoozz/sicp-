(define (expond a n)
  (define (even? x) (= (remainder x 2) 0))
  (define (square x) (* x x))
  (if (= n 0)
      1
      (if (even? n)
          (square (expond a (/ n 2)))
          (* a (expond a (- n 1))))))

(define (exp-mod base exp m)
  (remainder (expond base exp) m))


(define (fermat-test n)
  (define (try-it a)
    (= (exp-mod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n)
  (define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))
  (fast-prime? n 10))
