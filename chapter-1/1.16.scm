(define (fast-expt b  n)
  (fast-expt-iter 1 b n ))

(define (even? n)
  (= (remainder n 2) 0))
(define (square n)
  (* n n))

(define (fast-expt-iter product b n)
  (cond ( (= n 0) product)
        ( (even? n) (fast-expt-iter product  (square b)  (/ n 2)))
        ( else (fast-expt-iter (* product b) b (- n 1)))));;
