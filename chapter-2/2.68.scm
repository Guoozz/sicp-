(load "2.67.scm")

(define (encode message tree)
  (if (null? message)
      ()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol s branch)
  (cond  ((leaf? branch) '())
         ((element-of-set s (symbols (left-branch branch))) (cons 0 (encode-symbol s (left-branch branch))))
         ((element-of-set s (symbols (right-branch branch))) (cons 1 (encode-symbol s (right-branch branch))))
         (else error("no such symbols --ENCODE-SYMBOLD" s))))

(define (element-of-set x set)
  (if (null? set)
      false
      (if (eq? x (car set))
          true
          (element-of-set x (cdr set)))))
