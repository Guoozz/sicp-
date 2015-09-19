(define (repeate f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (define (iter cf n)
    (if (= n 1)
        cf
        (iter (compose f cf) (- n 1))))
  (iter f n))
