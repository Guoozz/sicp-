(load "1.37.scm")


(define (euler-number k)
  (+ 2.0
     (cont-frac-iter (lambda (i) 1)
                     (lambda (i) (if (= (remainder  i 3) 2)
                                      (/  (+ i 1) 1.5)
                                      1))
                     k)))
