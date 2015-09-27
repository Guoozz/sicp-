(load "2.38.scm")

(define (reverse sequence)
  (fold-left (lambda (x y)
               (cons y x))
             nil
             sequence))

(define (fold-right op init sequence)
  (accumulate op init sequence))

(define (reverse2 sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              nil
              sequence))
