(load "3.3.scm")

(define (make-joint account secret-number new-secret-number)
  ((account secret-number 'add) new-secret-number))
