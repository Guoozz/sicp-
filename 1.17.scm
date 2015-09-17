(load "common.scm")

;; s = 2*(a*b/2 )  = a*b  if n is even
;; s = a+a*(b - 1) = a*b  if n is odd

(define (halve n)  (/ n 2))
(define (double n) (+ n n))

(define (expt-mul a b)
  (if (= b 0)
      0
      (if (even? b)
          (double (expt-mul a (halve b)))
          (+ a (expt-mul a (- b 1))))))

;; 利用不变式
;; s = c + 2 * (a * b / 2) = c + a * b   if b is even
;; s = c + a + a*(b - 1)  = c + a * b    if b is odd
;; s = c + a + a*(b - 1) = c + a * b = c if b = 0

(define (expt-mul-iter a b)
  (define (iter a b c)
    (if (= b 0)
        c
        (if (even? b)
            (iter (double a) (halve b) c)
            (iter a (- b 1) (+ a c)))))
  (iter a b 0))
