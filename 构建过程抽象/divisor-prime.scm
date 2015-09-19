(define (search-divide n)
  (define (next n)
    (if (= n 2)
        3
        (+ n 2)))
  (define (iter test-divisor)
    (cond ((= n 1) 1)
           ((> (square test-divisor) n) n)
           ((divides?  test-divisor n) test-divisor)
           (else (iter (next test-divisor)))))
  (iter 2))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (search-divide n) n))
