(load "sum-iter")

(define (inc x) (+ x 1))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term k)
    (define y (f (+ a (* k h))))
    (define (even? k) (= (remainder k 2) 0))
    (cond ((or (= k 0) (= k n)) y)
          ((even? k) (* 2 y))
          (else (* 4 y))))
  (* (/ h 3)
     (sum 0.0 n simpson-term inc)))
