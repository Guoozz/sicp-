(load "sequences_interface.scm")

(define (fold-right op init sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init sequence))


; (fold-right / 1 (list 1 2 3))
; result:1/6  (1/1/2/3)
; (fold-left) 3/2 (1/(2/(3/1)))

;(flod-right list nil (list 1 2 3)) ((( () 1)2)3)
;(fold-left) (list 1 (list 2 list 3 (list 4 (list null))))
;(1 (2 (3 (4 ( () ))))
